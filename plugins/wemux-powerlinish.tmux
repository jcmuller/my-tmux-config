# https://gist.github.com/zolrath/2305333
set -g status-left-length 32
set -g status-right-length 150

#set -g status-left '#[fg=colour235,bg=colour252,bold] ❐ #S #[fg=colour252,bg=colour238,nobold]#[fg=colour245,bg=colour238,bold] #(whoami) #[fg=colour238,bg=colour234,nobold]'
#set -g window-status-format "#[fg=white,bg=colour234] #I #W "
#set -g window-status-current-format "#[fg=colour234,bg=colour39]#[fg=colour25,bg=colour39,noreverse,bold] #I  #W #[fg=colour39,bg=colour234,nobold]"
#set -g status-right "#(basic-cpu-and-memory.py)"

set -g status-left '#[fg=white,bg=#1564a7,bold] ❐ #S #[fg=#1564a7,bg=#afafaf,nobold]#[fg=#666666,bg=#afafaf,bold] #(whoami) #[fg=#afafaf,bg=#d6d6d6,nobold]'
set -g window-status-format "#[bg=#d6d6d6]  #I  #W  "
set -g window-status-current-format "#[fg=#d6d6d6,bg=#afafaf]#[fg=#666666,bg=#afafaf,noreverse,nobold] #I  #W #[fg=#afafaf,bg=#d6d6d6,nobold]"
set -g status-right '#[fg=#afafaf,bg=#d9d9d9,nobold]#[fg=#666666,bg=#afafaf] #(basic-cpu-and-memory.py) #[fg=#1564a7,bg=#afafaf,nobold]#[fg=white,bg=#1564a7] %a %D %I:%M %p'
