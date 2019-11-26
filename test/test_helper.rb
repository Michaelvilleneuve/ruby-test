ENV['APP_ENV'] = 'test'

require 'rack/test'
require 'minitest/autorun'
require 'minitest/unit'
require 'active_support'
require 'mocha/minitest'

Dir["lib/**/*.rb"].each {|file| require_relative "../#{file}"  }

class TestHelper < ActiveSupport::TestCase
  include Rack::Test::Methods
end
