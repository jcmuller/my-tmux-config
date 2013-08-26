# encoding: UTF-8

class BatteryBase
  def output_string
    "[#{bar(charge, 3)}] #{formatted_charge}#{is_charging? ? " C" : ""}"
  end

  private

  def charge
    bat_info[CURRENT_CAPACITY].to_f / bat_info[MAX_CAPACITY]
  end

  def bar(ratio, max = 10)
    "▓" * (ratio * max).to_i << " " * (max - (ratio * max).to_i)
  end

  def formatted_charge
    '%d%%' % (charge * 100)
  end

end
