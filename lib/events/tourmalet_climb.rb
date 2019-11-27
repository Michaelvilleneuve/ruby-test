module Events
  class TourmaletClimb < Base
    process do
      say '...'
      say 'It is getting really hilly out here. Everyone seems to be struggling and the Tourmalet is still high up there'
      say "Ok #{player.name}, this is the big challenge, the Tourmalet"

      ask 'A small forest path starts on the side of the road.',
          'Take it': shortcut,
          'Rest': rest,
          "Push #{opponent.name}": push_opponent

      say 'You are almost on top of the Tourmalet the finish line is getting close !'
      say @game.recap
      launch FinalSprint
    end

    path(:shortcut) do
      say "Good idea, #{opponent.name} managed to catch up but he loses 20 of power"
      opponent.power -= 20
      launch ShortcutHell
    end

    path(:rest) do
      say "Not a moment to rest #{opponent.name} just shifted to the big gear and you have to work harder to keep up"
      player.power -= 10
    end

    path(:push_opponent) do
      say 'Well done, you harmed yourself a bit but nothing too worrying'
      player.power -= 10
      opponent.power -= 30
    end
  end
end
