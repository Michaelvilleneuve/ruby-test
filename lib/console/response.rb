module Console
  class Response
    def initialize(response, expected_answers = nil)
      @response = response
      @expected_answers = expected_answers
    end

    def handle
      return exit if @response == 'exit'
      return ::Console::Tutorial.help if @response == 'help'
      return false unless valid_answer?

      @response
    end

    def valid_answer?
      return true if @expected_answers.nil?

      actually_valid = !(next_step = @expected_answers[@response.to_sym]).nil?
      next_step.call(@response) if actually_valid

      actually_valid
    end
  end
end
