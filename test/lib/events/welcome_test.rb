require_relative '../../test_helper'

module Events
  class WelcomeTest < TestHelper
    setup do
      Console::Response.any_instance.unstub(:valid_answer?)
    end

    test 'positive answer waits then takes you to the next event' do
      answer_with('yes')

      ::Events::Welcome.any_instance.expects(:sleep).with(1).once
      ::Events::MeetTheTeam.expects(:start).once
    
      ::Events::Welcome.start
    end
    
    test 'negative answer aborts game' do
      answer_with('no')

      ::Events::GameOver.expects(:start).once

      ::Events::Welcome.start
    end
  end
end