ENV['APP_ENV'] = 'test'

require 'rack/test'
require 'minitest/autorun'
require 'minitest/unit'
require 'active_support'
require 'mocha/minitest'

require_relative "../lib/events/base.rb"
Dir["lib/**/*.rb"].each {|file| require_relative "../#{file}"  }

class TestHelper < ActiveSupport::TestCase
  include Rack::Test::Methods

  setup do
    Console::Prompt.stubs(:say)
    Console::Response.any_instance.stubs(:valid_answer?).returns(true)
    Readline.stubs(:readline).returns('Default answer')
  end

  def mock_response(expected_answer)
    response_mock = ::Console::Response.new(expected_answer)
    ::Console::Response.stubs(:new).with(expected_answer, nil).returns(response_mock)
    Readline.expects(:readline).with('> ', true).once.returns(expected_answer)
  end

  def answer_with(*answers)
    Console::Response.any_instance.unstub(:valid_answer?)
    Readline.stubs(:readline).returns(*answers)
  end

  def create_game
    @game = Game.new
    @game.player = Environment::Cyclist.new('Michael')
    @game.player.adjust_power_to('local')
    
    @game.opponent = Environment::Cyclist.new('Regis')
    @game.opponent.adjust_power_to('local')
    @game
  end
end
