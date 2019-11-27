require_relative '../test_helper'

class GameTest < TestHelper
  test 'it works' do
    assert Game.is_a?(Module)
  end

  test 'allows to define a player and an opponent' do
    game = Game.new
    
    game.player = 'Sacha'
    game.opponent = 'Regis'

    assert_equal 'Regis', game.opponent
    assert_equal 'Sacha', game.player
  end
end
