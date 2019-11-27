module Environment
  class Cyclist
    attr_accessor :name, :power

    def initialize(name)
      @name = name
    end

    def adjust_power_to(fame)
      @power = self.class.levels[fame.to_sym] || rand(1...120)
    end

    def self.levels
      { unknown: 50, local: 75, celebrity: 100 }
    end
  end
end
