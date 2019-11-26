module Events
  class GameOver < Base
    process do
      ::Console::Prompt.say('Oh no, sorry to see you go, bye !')
    end
  end
end
