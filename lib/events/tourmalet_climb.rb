module Events
  class TourmaletClimb < Base
    process do
      say '...'
      say 'It is getting really hilly out here. Everyone seems to be struggling and the Tourmalet is still high up there'
      say "Ok #{player.name}, this is your first big challenge, the Tourmalet"

      ask 'A small forest path starts on the side of the road.',
          'Take it': shortcut,
          'Rest': shortcut,
          "Push #{opponent.name}": shortcut
    end

    path(:shortcut) do
      say "Good idea, #{opponent.name} managed to catch up but he loses 20 of power"
      opponent.power -= 20
    end
  end
end
