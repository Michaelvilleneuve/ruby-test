require_relative '../../test_helper'

module Events
  class MeetTheTeamTest < TestHelper
    setup do
      answer_with('Michaël')
      MeetTheTeam.any_instance.stubs(:launch)
      @event = MeetTheTeam.start(Game.new)
    end

    test 'process executes all required steps' do
      MeetTheTeam.any_instance.expects(:create_player).once
      MeetTheTeam.any_instance.expects(:ask_for_player_level).once
      MeetTheTeam.any_instance.expects(:start_the_race).once
      
      MeetTheTeam.start(Game.new)
    end

    test 'create_player creates the player with given name' do
      assert_equal 'Michaël', @event.instance_variable_get(:@game).player.name
    end

    test 'ask_for_player_level sets player level' do
      answer_with('celebrity')

      ::Environment::Cyclist.any_instance.expects(:adjust_power_to).with('celebrity')
      
      @event.ask_for_player_level
    end

    test 'ask_for_player_level says an easter egg when given inexistant level' do
      answer_with('I\'m the best!', 'celebrity')
      @event.expects(:say).once
      
      @event.ask_for_player_level
      @event.ask_for_player_level
    end

    test 'start_the_race creates the opponent' do
      answer_with('Regis')
      @event.start_the_race

      assert_equal 'Regis', @event.instance_variable_get(:@game).opponent.name
      assert_equal 75, @event.instance_variable_get(:@game).opponent.power 
    end

    test 'start_the_race makes the race begin!' do
      answer_with('Regis')
      @event.expects(:launch).with(Departure).once
      @event.start_the_race
    end
  end
end