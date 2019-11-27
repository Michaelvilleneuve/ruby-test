class Game
  attr_accessor :player, :opponent

  def self.play!
    new.play
  end

  def play
    Events::Welcome.start(self)
  end

  def recap
    return ::Console::Prompt.say('Game is not ready') if @player.nil? || @opponent.nil?

    ::Console::Prompt.say('--------')
    ::Console::Prompt.say('RECAP')
    ::Console::Prompt.say('--------')
    ::Console::Prompt.say("You have #{@player.power} points of power left")
    ::Console::Prompt.say("Your enemy #{@opponent.name} has #{@opponent.power} points left")
  end
end
