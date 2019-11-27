require 'active_support/time'

module Events
  class FinalSprint < ::Events::Base
    process do
      say 'A few hundreds meters left'
      say "You are still side by side with #{opponent.name}"
      say 'Your freshness compared to his will be the deciding factor, hit the enter key as fast as possible'

      say "To win you must hit any key more than #{total_hits_required} times during the 5 seconds sprint"

      ask 'Ready ?',
          yes: start_sprinting
    end

    path(:start_sprinting) do
      countdown
      sprint
      announce_winners
    end

    def required_velocity
      player.power.to_f / opponent.power
    end

    def initial_hits_per_seconds_to_win
      10
    end

    def sprint_duration
      5.seconds
    end

    def hits_per_seconds_to_win
      initial_hits_per_seconds_to_win / required_velocity
    end

    def total_hits_required
      (hits_per_seconds_to_win * sprint_duration.to_i).to_i
    end

    def sprint
      finish_line = Time.now + sprint_duration
      @hits = 0

      while finish_line > Time.now
        ask_only
        say @hits += 1
      end
    end

    def player_won?
      @hits >= total_hits_required
    end

    def announce_winners
      winner = player_won? ? player : opponent
      say "Speaker > VICTORY FOR #{winner.name.upcase} !!!"
      exit
    end
  end
end
