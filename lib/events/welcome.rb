module Events
  class Welcome < Base
    process do
      say ::Console::Tutorial.help

      ask 'Ready to go ?',
          'yes': game_open,
          'no': game_over
    end

    path :game_over do
      say 'Leaving already ??'
      ::Events::GameOver.start
    end

    path :game_open do
      say ::Console::Tutorial.introduction
      sleep 1
      ::Events::MeetTheTeam.start
    end
  end
end
