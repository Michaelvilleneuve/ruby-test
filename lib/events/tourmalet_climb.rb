module Events
  class TourmaletClimb < Base
    process do
      say '...'
      say 'It is getting really hilly out here. Everyone seems to be struggling and the Tourmalet is still high up there'
      say "Ok #{player.name}, this is your first big challenge, the Tourmalet"

      ask 'A small forest path starts on the side of the road.',
          'Take it': shortcut,
          'Rest': rest,
          "Push #{opponent.name}": push_opponent

      say 'You are almost on top of the Tourmalet the finish is right after the decent'
      say @game.recap
    end

    path(:shortcut) do
      say "Good idea, #{opponent.name} managed to catch up but he loses 20 of power"
      opponent.power -= 20
    end

    path(:rest) do
      say "Not a moment to rest #{opponent.name} just shifted to the big gear and you have to work harder to keep up"
      player.power -= 20
    end

    path(:push_opponent) do
      say 'Well done, you harmed yourself a bit but nothing too worrying'
      player.power -= 10
      opponent.power -= 30
    end
  end
end
