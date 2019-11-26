require_relative '../../test_helper'

module Console
  class ResponseTest < TestHelper
    setup do
      Console::Response.any_instance.unstub(:valid_answer?)
    end

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
    
    test 'if given expected answers, returns false if answer is not valid' do
      valid_answer = ::Console::Response.new('yes', 'yes': ->(r) {})
      invalid_answer = ::Console::Response.new('yes', 'OK': ->(r) {})
      
      assert valid_answer.valid_answer?, 'yes should be among valid responses'
      assert_not invalid_answer.valid_answer?, 'OK should not be among valid responses'
    end

    test 'when answer matches a possible response, execute bloc' do
      ::Console::Response.expects(:it_works).with('yes').once

      ::Console::Response.new('yes', 'yes': ->(res) { ::Console::Response.it_works(res) }).valid_answer?
    end

    test 'simply returns response otherwise' do
      ::Console::Tutorial.expects(:help).never
      assert_equal 'hi!', ::Console::Response.new('hi!').handle
    end
  end
end