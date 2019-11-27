module Events
  class ShortcutHell < ::Events::Base
    process do
      say 'The shortcut took you to a very open area, you can see the entire race !'

      ask 'Call for your teammates ?',
          'yes': call_for_help,
          'accelerate': accelerate

      say 'Back to the main road !'
    end

    path(:call_for_help) do
      say 'Your teammates are coming to help you, it gives you strength !'
      player.power += 20
    end

    path(:accelerate) do
      say '------------'
      sleep 1
      say 'Oh my god, you fell in a cliff you are about to die !'
      player.die
    end
  end
end
