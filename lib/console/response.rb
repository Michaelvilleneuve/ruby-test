module Console
  class Response
    def initialize(response)
      @response = response
    end

    def handle
      return exit if @response == 'exit'
      return ::Console::Tutorial.help if @response == 'help'

      @response
    end
  end
end
