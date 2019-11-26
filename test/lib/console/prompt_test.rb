require_relative '../../test_helper'

module Console
  class PromptTest < TestHelper
    test 'ask allows to prompt something' do
      expected_answer = 'fine!'
      mock_response(expected_answer)

      assert_equal expected_answer, ::Console::Prompt.ask('how are you ?')
    end

    test 'ask delegates response to response handler' do
      ::Console::Response.any_instance.expects(:handle).once.returns('ok')
      ::Console::Prompt.ask('how are you ?')
    end

    test 'ask does not talk if no arg given' do
      ::Console::Prompt.expects(:say).once
      ::Console::Prompt.ask('how are you ?')

      ::Console::Prompt.expects(:say).never
      ::Console::Prompt.ask
    end

    test 'ask with possible answers adds answers to the question' do
      ::Console::Prompt.expects(:say).with('how are you ? ok/good').once
      ::Console::Prompt.ask('how are you ?', 'ok': ->(r) {}, 'good': ->(r) {})
    end

    test 'when given unsatisfying answer ask keeps asking' do
      Console::Response.any_instance.unstub(:valid_answer?)
      Readline.expects(:readline).times(4).returns(
        'bad',
        'horrible',
        'ok',
        'good',
        'great'
      )

      ::Console::Prompt.ask('how are you ?', 'good': ->(r) {})
    end
  end
end