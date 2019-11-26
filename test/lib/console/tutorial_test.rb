require_relative '../../test_helper'

module Console
  class TutorialTest < TestHelper
    test 'help returns simple tutorial' do
      assert ::Console::Tutorial.help.is_a?(String), 'Should return a string tutorial'
      assert ::Console::Tutorial.help.include?('exit'), 'Should at least describe the exit command'
    end
  end
end