#!/usr/bin/env ruby

# Create a nice layout for us

unless ENV["TERM"] =~ /screen/ && !ENV['TMUX'].nil?
  STDERR.puts "Why are you trying to set up some tmux things from outside of tmux???"
  exit
end

cmd = ""

panes = `tmux list-panes -F "#P" | tail -1`.strip.to_i
height = `tmux display-message -p '\#{session_height}'`.to_i

if panes < 4
  (4 - panes).times do
    cmd += "tmux split-window -d -t1 -p 33"
  end
end

cmd += <<-EOF

tmux select-layout main-vertical > /dev/null

tmux select-pane -t 1
tmux split-window -d -t 1 -p 33 '/bin/sh'
tmux select-pane -t 1
tmux swap-pane -s 2 -t 4
tmux select-pane -t 1
tmux kill-pane -t 4

tmux select-pane -t 1
tmux split-window -d -t 1 -p 33 '/bin/sh'
tmux select-pane -t 1
tmux swap-pane -s 2 -t 5
tmux select-pane -t 1
tmux kill-pane -t 5

tmux swap-pane -s 2 -t 4

tmux resize-pane -t 1 -y #{((height - 10 - 2) / 2).to_i}
tmux resize-pane -t 3 -y 10

tmux clock-mode -t 3

tmux select-pane -t 4

EOF

cmd += "tmux resize-pane -t 5 -y 10" if panes > 4

system cmd
