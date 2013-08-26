#!/usr/bin/env ruby

require "#{File.dirname(__FILE__)}/battery_base"

class BatteryInfoPMSet < BatteryBase
  BatteryBase::CURRENT_CAPACITY = "CurrentCapacity"
  BatteryBase::FULLY_CHARGED = "FullyCharged"
  BatteryBase::IS_CHARGING = "IsCharging"
  BatteryBase::MAX_CAPACITY = "MaxCapacity"

  def output_string
    "[#{bar(charge, 4)}] #{formatted_charge}#{bat_info[:status]}"
  end

  def charge
    bat_info[:charge].to_f / 100
  end

  def bat_info
    @bat_info ||= begin
                    info = `pmset -g ps`
                    {
                      charge: info.scan(/(\d+)%;/).join,
                      status: begin
                                case info
                                when /discharging/
                                  "-"
                                when /charging/
                                  "+"
                                else
                                  "="
                                end
                    end
                    }
                  end
  end

end

puts BatteryInfoPMSet.new.output_string
