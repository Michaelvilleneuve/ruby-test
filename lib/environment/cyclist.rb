module Environment
  class Cyclist
    attr_accessor :name, :power

    def initialize(name)
      @name = name
    end

    def adjust_power_to(fame)
      @power = self.class.levels[fame.to_sym] || rand(1...120)
    end

    def attack
      @power -= 30

      raise CyclistKOError, "Player #{@name} is too tired, game over." if @power.negative?
    end

    def die
      raise CyclistKOError, 'You are dead'
    end

    def self.levels
      { unknown: 50, local: 75, celebrity: 100 }
    end
  end

  class CyclistKOError < StandardError
  end
end
