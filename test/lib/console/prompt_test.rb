require_relative '../../test_helper'

module Console
  class PromptTest < TestHelper
    test 'ask allows to prompt something' do
      expected_answer = 'fine!'
      mock_response(expected_answer)

      assert_equal expected_answer, ::Console::Prompt.ask('how are you ?')
    end

    test 'ask delegates response to response handler' do
      ::Console::Response.any_instance.expects(:handle).once
      ::Console::Prompt.ask('how are you ?')
    end

    test 'ask does not talk if no arg given' do
      ::Console::Prompt.expects(:say).once
      ::Console::Prompt.ask('how are you ?')

      ::Console::Prompt.expects(:say).never
      ::Console::Prompt.ask
    end
  end
end