require_relative '../../test_helper'

module Events
  class DepartureTest < TestHelper
    setup do
      game = create_game
      Events::Departure.any_instance.stubs(:sleep)
      @event = Departure.start(@game)
    end

    test 'countdown counts from 3 to 1' do
      Events::Departure.any_instance.expects(:say).with("3....").once
      Events::Departure.any_instance.expects(:say).with("2....").once
      Events::Departure.any_instance.expects(:say).with("1....").once
      Events::Departure.any_instance.expects(:say).with("GOO !!!").once
      Events::Departure.any_instance.expects(:sleep).with(1).times(3)

      Departure.start(@game)
    end
  end
end