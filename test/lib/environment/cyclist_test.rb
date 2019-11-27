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
  end
end