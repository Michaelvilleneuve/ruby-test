require_relative '../../test_helper'

module Events
  class DepartureTest < TestHelper
    setup do
      @game = create_game
      Console::Response.any_instance.unstub(:valid_answer?)
      Events::Departure.any_instance.stubs(:sleep)
      Events::TourmaletClimb.any_instance.stubs(:start)
    end

    test 'countdown counts from 3 to 1' do
      Events::Departure.any_instance.expects(:say).with("3....").once
      Events::Departure.any_instance.expects(:say).with("2....").once
      Events::Departure.any_instance.expects(:say).with("1....").once
      Events::Departure.any_instance.expects(:say).with("GOO !!!").once
      Events::Departure.any_instance.expects(:sleep).with(1).times(3)

      Departure.new(@game).countdown
    end

    test 'attack makes player attack and fail' do
      answer_with('attack')
      @game.player.expects(:attack).once
      Departure.start(@game)
    end

    test 'wait takes you to the col du tourmalet' do
      answer_with('wait')
      Departure.any_instance.expects(:launch).with(TourmaletClimb)
      Departure.start(@game)
    end
  end
end