module Environment
  class Cyclist
    attr_accessor :name, :power

    def initialize(name)
      @name = name
    end

    def adjust_power_to(fame)
      @power = { unknown: 50, local: 75, celebrity: 100 }[fame.to_sym] || rand(1...120)
    end
  end
end
