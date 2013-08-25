#!/usr/bin/env ruby

#require 'osx/plist'

class BatteryInfo
  def output_string
    "[#{bar(charge)}] #{formatted_charge}#{is_charging? ? " C" : ""}"
  end

  private

  CURRENT_CAPACITY = "CurrentCapacity"
  FULLY_CHARGED = "FullyCharged"
  IS_CHARGING = "IsCharging"
  MAX_CAPACITY = "MaxCapacity"

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

puts BatteryInfo.new.output_string
