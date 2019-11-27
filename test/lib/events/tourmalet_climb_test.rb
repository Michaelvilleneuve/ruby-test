require_relative '../../test_helper'

module Events
  class TourmaletClimbTest < TestHelper
    setup do
      @game = create_game
      ShortcutHell.stubs(:start)
    end

    test 'shortcut gives you a head start' do
      answer_with('Take it')
      initial_power = @game.opponent.power
      TourmaletClimb.start(@game)
      
      assert initial_power > @game.opponent.power
    end

    test 'shortcut calls the ShortcutHell path' do
      answer_with('Take it')
      TourmaletClimb.any_instance.expects(:launch).with(ShortcutHell).once
      TourmaletClimb.start(@game)
    end

    test 'rest makes you loose power to keep up' do
      answer_with('Rest')
      initial_power = @game.player.power
      TourmaletClimb.start(@game)
      
      assert initial_power > @game.player.power
    end

    test 'push_opponent burns power to everyone especially the oponent' do
      answer_with('Push Regis')
      player_initial_power = @game.player.power
      opponent_initial_power = @game.opponent.power

      TourmaletClimb.start(@game)
      
      assert_equal @game.player.power, player_initial_power - 10 
      assert_equal @game.opponent.power, opponent_initial_power - 30 
    end
  end
end