#!/usr/bin/env ruby

require "#{File.dirname(__FILE__)}/battery_base"

class BatteryInfoIOREG < BatteryBase
  BatteryBase::CURRENT_CAPACITY = "CurrentCapacity"
  BatteryBase::FULLY_CHARGED = "FullyCharged"
  BatteryBase::IS_CHARGING = "IsCharging"
  BatteryBase::MAX_CAPACITY = "MaxCapacity"

  def is_charging?
    bat_info[IS_CHARGING] == "Yes"
  end

  def bat_info
    @bat_info ||= begin
                    data = `ioreg -k CurrentCapacity | sed -ne '/AppleSmartBattery /,/     }/ p'`

                    values = data.gsub("|", "").
                      gsub(/=/, '=>').
                      gsub(/ Yes/, ' "Yes"').
                      gsub(/ No/, ' "No"').
                      split(/\n/).
                      reject{ |l| l =~ /Manufacturer|CellVoltage/ }.
                      grep(/"\w+" => .+/).
                      map(&:strip!).join(",")

                    eval("{#{values}}")
                  end
  end

end

puts BatteryInfoIOREG.new.output_string
