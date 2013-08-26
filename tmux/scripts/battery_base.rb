class BatteryBase
  def output_string
    "[#{bar(charge)}] #{formatted_charge}#{is_charging? ? " C" : ""}"
  end

  private

  def charge
    bat_info[CURRENT_CAPACITY].to_f / bat_info[MAX_CAPACITY]
  end

  def bar(ratio)
    "|" * (ratio * 10).to_i << " " * (10 - (ratio * 10).to_i)
  end

  def formatted_charge
    '%.2f%%' % (charge * 100)
  end

end
