class Game
  def self.play!
    Console::Prompt.ask('Are you ready?')
  end
end
