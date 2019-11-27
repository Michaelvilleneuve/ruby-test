require 'readline'

module Console
  class Prompt
    def initialize(question, expected_answers)
      @expected_answers = question.is_a?(Hash) ? question : expected_answers
      @question = question.is_a?(Hash) ? nil : question
    end

    def ask
      Console::Prompt.say(question_with_answers) unless @question.nil?

      @answer = self.class.ask_only
      ask_again_or_return
    end

    def self.ask_only
      Readline.readline('> ', true)
    end

    def self.say(something)
      puts something
    end

    def self.ask(question = nil, expected_answers = nil)
      new(question, expected_answers).ask
    end

    private

    def question_with_answers
      return @question if @expected_answers.nil?

      "#{@question} #{@expected_answers.keys.join('/')}"
    end

    def ask_again_or_return
      treated_answer = ::Console::Response.new(@answer, @expected_answers).handle
      treated_answer || ask
    end
  end
end
