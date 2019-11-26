require_relative '../test_helper'

class GameTest < TestHelper
  test 'it works' do
    assert Game.is_a?(Module)
  end
end
