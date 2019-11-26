ENV['APP_ENV'] = 'test'

require 'rack/test'
require 'minitest/autorun'
require 'minitest/unit'
require 'active_support'
require 'mocha/minitest'

Dir["lib/**/*.rb"].each {|file| require_relative "../#{file}"  }

class TestHelper < ActiveSupport::TestCase
  include Rack::Test::Methods

  setup do
    Console::Prompt.stubs(:say)
    Readline.stubs(:readline).returns('Default answer')
  end

  def mock_response(expected_answer)
    response_mock = ::Console::Response.new(expected_answer)
    ::Console::Response.stubs(:new).with(expected_answer).returns(response_mock)
    Readline.expects(:readline).with('>', true).once.returns(expected_answer)
  end
end
