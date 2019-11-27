module Console
  class Response
    def initialize(response, expected_answers = nil)
      @response = response
      @expected_answers = expected_answers
    end

    def handle
      return exit if @response == 'exit'
      return false if asked_for_tutorial? || !valid_answer?

      @response
    end

    def asked_for_tutorial?
      shoud_show_tutorial = @response == 'help'
      ::Console::Prompt.say(::Console::Tutorial.help) if shoud_show_tutorial
      shoud_show_tutorial
    end

    def valid_answer?
      return true if @expected_answers.nil?

      actually_valid = !(next_step = @expected_answers[@response.to_sym]).nil?
      next_step.call(@response) if actually_valid

      actually_valid
    end
  end
end
