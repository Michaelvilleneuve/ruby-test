class Game
  attr_accessor :player, :opponent

  def self.play!
    new.play
  end

  def play
    Events::Welcome.start(self)
  end
end
