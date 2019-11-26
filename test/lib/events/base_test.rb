require_relative '../../test_helper'

module Events
  class TestableEvent < ::Events::Base
    process do
      ::Events::TestableEvent.in_bloc
    end
    
    path(:a_path) do
      ::Events::TestableEvent.in_first_path
    end
  end

  class BaseTest < TestHelper
    test 'events have an easy access to the console layer' do
      assert ::Events::TestableEvent.new.respond_to?(:say)
      assert ::Events::TestableEvent.new.respond_to?(:ask)
    end
    
    test 'start calls process bloc' do
      ::Events::TestableEvent.expects(:in_bloc).once
      ::Events::TestableEvent.start
    end

    test 'path DSL allows to define instance_level logic' do
      assert ::Events::TestableEvent.new.respond_to?(:a_path), 'instance method should exist'
    end

    test 'event without process raises runtime exception' do
      class IncorrectEvent < ::Events::Base
      end
      assert_raises RuntimeError do
        IncorrectEvent.start
      end
    end
  end
end