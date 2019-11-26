require 'forwardable'

module Events
  class Base
    extend Forwardable
    attr_reader :paths

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

    def start; end

    def self.process(&block)
      define_method(:start) do
        instance_eval(&block)
      end
    end

    def answer(something); end
  end
end
