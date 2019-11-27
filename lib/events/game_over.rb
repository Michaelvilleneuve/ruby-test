module Events
  class GameOver < ::Events::Base
    process do
      say 'Oh no, sorry to see you go, bye !'
      exit
    end
  end
end
