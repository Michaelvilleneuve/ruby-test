require_relative '../../test_helper'

module Environment
  class CyclistTest < TestHelper
    setup do
      @cyclist = Cyclist.new('Michael')
    end

    test 'cyclists have a name' do
      assert_equal 'Michael', @cyclist.name
    end

    test 'given a level of fame adjust_power_to determines a cyclist power' do
      @cyclist.adjust_power_to('celebrity')
      assert_equal 100, @cyclist.power

      @cyclist.adjust_power_to('unknown')
      assert_equal 50, @cyclist.power
    end

    test 'given an unknown level of fame, adjust_power_to chooses random power' do
      @cyclist.adjust_power_to('world famous')
      assert @cyclist.power > 0 && @cyclist.power <= 120, 'Power should be in the appropriate range'
    end

    test 'attacking reduces cyclist power' do
      @cyclist.power = 50
      @cyclist.attack
      assert_equal 20, @cyclist.power
    end

    test 'attacking when too tired causes cyclist to give up' do
      @cyclist.power = 10
      assert_raises Environment::CyclistKOError do
        @cyclist.attack
      end
    end

    test 'die goes immediately game over' do
      assert_raises Environment::CyclistKOError do
        @cyclist.die
      end
    end
  end
end