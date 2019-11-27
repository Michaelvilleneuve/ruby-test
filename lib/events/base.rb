require 'forwardable'

module Events
  class Base
    extend Forwardable

    def_delegators :@console, :say, :ask

    def initialize(*args)
      @console = ::Console::Prompt
      @arguments = args
    end

    def self.start(*args)
      event = new(*args)
      event.start
      event
    end

    def start
      raise 'All event must define a process'
    end

    def self.process(&block)
      define_method(:start) do
        instance_eval(&block)
      end
    end

    def self.path(name, &block)
      define_method(name) do
        proc { |args| instance_exec(args, &block) }
      end
    end
  end
end
