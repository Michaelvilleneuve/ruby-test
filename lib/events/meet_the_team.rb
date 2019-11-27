module Events
  class MeetTheTeam < Base
    process do
      create_player
      ask_for_player_level
      start_the_race
    end

    def create_player
      name = ask 'First, I forgot, what\'s your name ?'
      @player = ::Environment::Cyclist.new(name)
    end

    def ask_for_player_level
      levels = ::Environment::Cyclist.levels.keys.map(&:to_s)
      fame   = ask "Wait #{@player.name}, are you famous are you ? #{levels.join('?')}"
      say 'Ok looks like you are a real player!' unless levels.include?(fame)

      @player.adjust_power_to(fame)
    end

    def start_the_race
      say 'Looks like you are all set ! Remember, your goal is to win the race and therefore beat your biggest opponent.'
      name = ask 'What is his name already ?'
      @opponent = ::Environment::Cyclist.new(name)
      @opponent.adjust_power_to(:local)

      launch BeginRace
    end
  end
end
