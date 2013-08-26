#!env ruby
# via @exchgr

puts ("%i%%%s" % `pmset -g ps`.scan(/(\d+)%; (\w*);/).flatten).gsub("discharging", "-").gsub("charging", "+").gsub("charged", "=")
