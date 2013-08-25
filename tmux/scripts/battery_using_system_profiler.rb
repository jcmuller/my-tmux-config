#!/usr/bin/env ruby

require 'osx/plist'

class BatteryInfo
  def output_string
    "[#{bar(charge)}] #{formatted_charge}#{is_charging? ? " C" : ""}"
  end

  private

  CHARGE_INFO = "sppower_battery_charge_info"
  CURRENT_CAPACITY = "sppower_battery_current_capacity"
  FULLY_CHARGED = "sppower_battery_fully_charged"
  IS_CHARGING = "sppower_battery_is_charging"
  MAX_CAPACITY = "sppower_battery_max_capacity"

  def charge
    bat_info[CURRENT_CAPACITY].to_f / bat_info[MAX_CAPACITY]
  end

  def bar(ratio)
    "|" * (ratio * 10).to_i << " " * (10 - (ratio * 10).to_i)
  end

  def formatted_charge
    '%.2f%%' % (charge * 100)
  end

  def is_charging?
    bat_info[IS_CHARGING] == "TRUE"
  end

  def bat_info
    @bat_info ||= OSX::PropertyList.load(`system_profiler -xml SPPowerDataType`)[0]\
      ["_items"][0][CHARGE_INFO]
  end

end

puts BatteryInfo.new.output_string
