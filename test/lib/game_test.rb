require_relative '../test_helper'

class GameTest < TestHelper
  test 'allows to define a player and an opponent' do
    game = Game.new
    
    game.player = 'Sacha'
    game.opponent = 'Regis'

    assert_equal 'Regis', game.opponent
    assert_equal 'Sacha', game.player
  end

  test 'recap gives the status of the game' do
    game = create_game
    
    ::Console::Prompt.expects(:say).with('You have 75 points of power left').once
    ::Console::Prompt.expects(:say).with('Your enemy Regis has 75 points left').once

    game.recap
  end
end
