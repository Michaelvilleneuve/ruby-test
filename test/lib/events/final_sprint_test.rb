require_relative '../../test_helper'

module Events
  class FinalSprintTest < TestHelper
    setup do
      FinalSprint.any_instance.stubs(:sleep)
      FinalSprint.any_instance.stubs(:countdown)
      @event = FinalSprint.start(create_game)
    end

    test 'required_velocity computes the required velocity to win' do
      Environment::Cyclist.any_instance.stubs(:power).returns(10, 20)
      assert_equal 0.5, @event.required_velocity.to_f
      
      Environment::Cyclist.any_instance.stubs(:power).returns(20, 10)
      assert_equal 2, @event.required_velocity.to_f

      Environment::Cyclist.any_instance.stubs(:power).returns(100, 10)
      assert_equal 10, @event.required_velocity.to_f
    end

    test 'hits_per_seconds_to_win defines the number of hits_per_seconds required to win the race' do
      Environment::Cyclist.any_instance.stubs(:power).returns(10, 20)
      assert_equal 20, @event.hits_per_seconds_to_win
      
      Environment::Cyclist.any_instance.stubs(:power).returns(20, 10)
      assert_equal 5, @event.hits_per_seconds_to_win

      Environment::Cyclist.any_instance.stubs(:power).returns(100, 10)
      assert_equal 1, @event.hits_per_seconds_to_win
    end

    test 'total_hits_required multiplies hits_per_second with sprint duration' do
      event = FinalSprint.start(create_game)

      Environment::Cyclist.any_instance.stubs(:power).returns(10, 20)
      assert_equal 100, event.total_hits_required
    end

    test 'sprint allows to type during 10 seconds' do
      answer_with('yes')
      @event.stubs(:ask_only)
      @event.stubs(:announce_winners)
      passing_seconds = [
        Time.parse("Wed Nov 27 13:30:00"),
        Time.parse("Wed Nov 27 13:30:01"),
        Time.parse("Wed Nov 27 13:30:03"),
        Time.parse("Wed Nov 27 13:30:06"),
        Time.parse("Wed Nov 27 13:30:11"),
        Time.parse("Wed Nov 27 13:30:13")
      ]
      Time.expects(:now).returns(*passing_seconds).times(4)

      @event.start

      # Only 2 iterations of the loop during the mocked time interval
      assert_equal 2, @event.instance_variable_get(:@hits)
    end

    test 'announce_winner exits game when finish' do
      stub_sprint_loop

      assert_raises SystemExit do
        @event.start
      end
    end

    test 'player_won? tels if player won' do
      @event.instance_variable_set(:@hits, 100)
      assert @event.player_won?
      @event.instance_variable_set(:@hits, 1)
      assert_not @event.player_won?
    end

    test 'announce_winners announces the right winner' do
      @event.stubs(:player_won?).returns(true)
      @event.expects(:say).with("Speaker > VICTORY FOR MICHAEL !!!")
      
      assert_raises SystemExit do
        @event.announce_winners
      end

      @event.stubs(:player_won?).returns(false)
      @event.expects(:say).with("Speaker > VICTORY FOR REGIS !!!")
      
      assert_raises SystemExit do
        @event.announce_winners
      end
    end

    def stub_sprint_loop
      answer_with('yes')
      
      FinalSprint.any_instance.stubs(:ask_only)
      passing_seconds = [ Time.parse("Wed Nov 27 13:30:00"), Time.parse("Wed Nov 27 13:30:15"), ]
      Time.expects(:now).returns(*passing_seconds).at_least_once
    end
  end
end