require_relative '../../test_helper'

module Console
  class ResponseTest < TestHelper
    test 'exits console when typing "exit"' do
      response = ::Console::Response.new('exit')

      assert_raises SystemExit do 
        response.handle      
      end
    end

    test 'calls for tutorial when typing "help"' do
      ::Console::Tutorial.expects(:help).once
      ::Console::Response.new('help').handle
    end
    
    test 'simply returns response otherwise' do
      ::Console::Tutorial.expects(:help).never
      assert_equal 'hi!', ::Console::Response.new('hi!').handle
    end
  end
end