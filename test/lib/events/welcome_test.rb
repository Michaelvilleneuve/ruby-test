require_relative '../../test_helper'

module Events
  class WelcomeTest < TestHelper
    test 'has two potential paths' do
      assert_equal 2, ::Events::Welcome.new.paths
    end

    test 'positive answer takes you to the next event' do
      event = ::Events::Welcome.start
      event.answer('GO')
    end

    test 'negative answer aborts game' do
      event = ::Events::Welcome.start

      ::Events::GameOver.expects(:start).once
      event.answer('NO')
    end
  end
end