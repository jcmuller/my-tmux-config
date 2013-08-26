#!/usr/bin/env ruby

require "#{File.dirname(__FILE__)}/battery_base"
require 'osx/plist'

class BatteryInfoSystemProfiler < BatteryBase

  BatteryBase::CHARGE_INFO = "sppower_battery_charge_info"
  BatteryBase::CURRENT_CAPACITY = "sppower_battery_current_capacity"
  BatteryBase::FULLY_CHARGED = "sppower_battery_fully_charged"
  BatteryBase::IS_CHARGING = "sppower_battery_is_charging"
  BatteryBase::MAX_CAPACITY = "sppower_battery_max_capacity"

  def is_charging?
    bat_info[IS_CHARGING] == "TRUE"
  end

  def bat_info
    @bat_info ||= OSX::PropertyList.load(`system_profiler -xml SPPowerDataType`)[0]\
      ["_items"][0][CHARGE_INFO]
  end
end

puts BatteryInfoSystemProfiler.new.output_string
