require_relative '../../test_helper'

module Events
  class ShortcutHellTest < TestHelper
    setup do
      @game = create_game
    end

    test 'call_for_help gives you strength back' do
      answer_with('yes')
      initial_power = @game.player.power
      ShortcutHell.start(@game)
      
      assert initial_power < @game.player.power
    end

    test 'accelerate waits then makes you die' do
      answer_with('accelerate')
      ShortcutHell.any_instance.expects(:sleep).with(1).once

      assert_raises Environment::CyclistKOError do
        ShortcutHell.start(@game)
      end
    end
  end
end