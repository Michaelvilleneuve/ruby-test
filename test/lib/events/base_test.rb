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

    test 'CyclistKOError triggers GameOver' do
      game = create_game
      class EventWithGameOver < ::Events::Base
        process do
          player.die
        end
      end

      GameOver.expects(:start).once
      EventWithGameOver.start(game)
    end

    test 'launch DSL allows to launch an event with adequate params' do
      class EventWithoutLaunch < ::Events::Base
      end

      class EventWithLaunch < ::Events::Base
        process do
          launch EventWithoutLaunch
        end
      end

      EventWithoutLaunch.any_instance.expects(:start).once

      EventWithLaunch.start
    end
  end
end