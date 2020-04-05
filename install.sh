# Author arthurkiller
# email arthur-lee@qq.com
# data 2017-1-4
# this shell is used for initialize the tmux-config

#!/bin/bash


if-shell "test '#{$TMUX_VERSION_MAJOR} -gt 1 -o \( #{$TMUX_VERSION_MAJOR} -eq 1 -a #{$TMUX_VERSION_MINOR} -ge 8 \)'" 'unbind %; bind % split-window -h -c "#{pane_current_path}"'
exit

trap exit ERR
if [ -d $HOME/.tmux  ]
then
    echo .tmux already exist
    mv $HOME/.tmux $HOME/.tmux.bak
fi

if [ -e $HOME/.tmux.conf  ]
then
    echo .tmux.conf already exist
    mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
fi

cp -r $HOME/.config/tmux-config $HOME/.tmux
ln -s $HOME/.tmux/.tmux.conf $HOME/.tmux.conf

brew install tmux-mem-cpu-load

tmux source-file ~/.tmux/tmux.conf
