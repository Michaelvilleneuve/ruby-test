require_relative '../../test_helper'

module Events
  class TourmaletClimbTest < TestHelper
    setup do
      @game = create_game
    end

    test 'shortcut gives you a head start' do
      answer_with('Take it')
      initial_power = @game.opponent.power
      TourmaletClimb.start(@game)
      
      assert initial_power > @game.opponent.power
    end
  end
end