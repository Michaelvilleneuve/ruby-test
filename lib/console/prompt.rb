require 'readline'

module Console
  class Prompt
    def self.ask(question = nil)
      say(question) unless question.nil?

      answer = Readline.readline('>', true)

      ::Console::Response.new(answer).handle
    end

    def self.say(something)
      puts something
    end
  end
end
