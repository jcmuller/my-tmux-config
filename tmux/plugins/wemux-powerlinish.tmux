# Based on https://gist.github.com/zolrath/2305333
set -g status-left-length 32
set -g status-right-length 150

# set -g status-left '#[fg=white,bg=#1564a7,bold] ❐ #S #[fg=#1564a7,bg=#afafaf,nobold]#[fg=#666666,bg=#afafaf,bold] #(whoami) #[fg=#afafaf,bg=#d6d6d6,nobold]'
# set -g window-status-format "#[bg=#d6d6d6]  #I  #W  "
# set -g window-status-current-format "#[fg=#d6d6d6,bg=#afafaf]#[fg=#666666,bg=#afafaf,noreverse,nobold] #I  #W #[fg=#afafaf,bg=#d6d6d6,nobold]"
# set -g status-right '#[fg=#afafaf,bg=#d9d9d9,nobold]#[fg=#666666,bg=#afafaf] #(~/.tmux/scripts/basic-cpu-and-memory.py) #[fg=#1564a7,bg=#afafaf,nobold]#[fg=white,bg=#1564a7] %a %b %d %I:%M %p  Bat: #(~/.tmux/scripts/battery.rb)'

# ASCII
# set -g status-left '#[fg=white,bg=#1564a7,bold] ❐ #S #[fg=#1564a7,bg=#afafaf,nobold]>#[fg=#666666,bg=#afafaf,bold] #(whoami) #[fg=#afafaf,bg=#d6d6d6,nobold]>'
# set -g window-status-format "#[bg=#d6d6d6] #I #W "
# set -g window-status-current-format "#[fg=#d6d6d6,bg=#afafaf]>#[fg=#666666,bg=#afafaf,noreverse,nobold] #I #W #[fg=#afafaf,bg=#d6d6d6,nobold]>"
# set -g status-right ''

# POWERLINE
set -g status-left '#[fg=white,bg=#1564a7,bold] ❐ #S #[fg=#1564a7,bg=#afafaf,nobold]#[fg=#666666,bg=#afafaf,bold] #(whoami) #[fg=#afafaf,bg=#d6d6d6,nobold]'
set -g window-status-format "#[bg=#d6d6d6]  #I  #W  "
set -g window-status-current-format "#[fg=#d6d6d6,bg=#afafaf]#[fg=#666666,bg=#afafaf,noreverse,nobold] #I  #W #[fg=#afafaf,bg=#d6d6d6,nobold]"
set -g status-right '#[fg=#afafaf,bg=#d9d9d9,nobold]#[fg=#666666,bg=#afafaf] #(~/.tmux/scripts/basic-cpu-and-memory.py) #[fg=#1564a7,bg=#afafaf,nobold]#[fg=white,bg=#1564a7] %a %b %d %I:%M %p'

# Character pair    Replaced with
#                            #(shell-command)  First line of the
# command's output
#                            #[attributes]     Colour or attribute
# change
#                            #H                Hostname of local host
#                            #h                Hostname of local host without the domain name
#                            #F                Current window flag
#                            #I                Current window index
#                            #D                Current pane unique
# identifier
#                            #P                Current pane index
#                            #S                Session name
#                            #T                Current pane title
#                            #W                Current window name
#                            ##                A literal `#'
#
# The #(shell-command) form executes `shell-command' and inserts the first line of its output.
# Note that shell commands are only executed once at the interval specified by the
# status-interval option: if the status line is redrawn in the meantime, the previous result is
# used.  Shell commands are exe- cuted with the tmux global environment set (see the ENVIRONMENT
# section).
#
# For details on how the names and titles can be set see the NAMES AND TITLES section.
#
# #[attributes] allows a comma-separated list of attributes to be specified, these may be
# `fg=colour' to set the foreground colour, `bg=colour' to set the background colour, the name of
# one of the attributes (listed under the message-attr option) to turn an attribute on, or an
# attribute prefixed with `no' to turn one off, for example nobright.  Examples are:
#
#   #(sysctl vm.loadavg)
#   #[fg=yellow,bold]#(apm -l)%%#[default] [#S]
#
# Where appropriate, special character sequences may be prefixed with a number to specify the
# maximum length, for example `#24T'.
#
# By default, UTF-8 in string is not interpreted, to enable UTF-8, use the status-utf8 option.`
