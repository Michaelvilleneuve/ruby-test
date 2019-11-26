require_relative '../../test_helper'

module Events
  class WelcomeTest < TestHelper
    setup do
      Console::Response.any_instance.unstub(:valid_answer?)
    end

    def answer_with(*answers)
      Readline.stubs(:readline).returns(*answers)
    end

    test 'positive answer takes you to the next event' do
      answer_with('yes')
    
      ::Events::Welcome.start
    end
    
    test 'negative answer aborts game' do
      answer_with('no')

      ::Events::GameOver.expects(:start).once

      ::Events::Welcome.start
    end
  end
end