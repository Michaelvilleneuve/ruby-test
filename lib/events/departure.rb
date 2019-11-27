module Events
  class Departure < Base
    process do
      countdown

      say '...'

      ask 'The pack seems to have set a pretty slow pace, time to react.',
          attack: attack,
          wait: wait

      launch TourmaletClimb
    end

    path(:attack) do
      say "Speaker > ATTACK FROM #{player.name.upcase} AT THE FRONT OF THE PELOTON"
      player.attack
      sleep 1
      say "Speaker > Oops, spoke too early #{player.name} has already been caught back !"
    end

    path(:wait) do
      say 'Wise decision, a big climb is coming !'
    end

    def countdown
      3.downto(1) do |remaining_seconds|
        say "#{remaining_seconds}...."
        sleep 1
      end
      say 'GOO !!!'
    end
  end
end
