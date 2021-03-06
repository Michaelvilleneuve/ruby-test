module Events
  class Welcome < ::Events::Base
    process do
      say ::Console::Tutorial.help

      ask 'Ready to go ?',
          'yes': game_open,
          'no': game_over
    end

    path :game_over do
      say 'Leaving already ??'
      launch ::Events::GameOver
    end

    path :game_open do
      say ::Console::Tutorial.introduction
      sleep 1
      launch ::Events::MeetTheTeam
    end
  end
end
