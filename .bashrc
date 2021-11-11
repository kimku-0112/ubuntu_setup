# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

LANG="ko_KR.UTF-8"
export LANG="ko_KR.UTF-8"


#echo 'jwt'|sudo -S /home/jwt/jwt/rail_controller

#source
source /opt/ros/kinetic/setup.bash
source ~/JCoLAR_ws/taskscript_engine/devel/setup.bash
source ~/JCoLAR_ws/external_wrappers/devel/setup.bash
source ~/JCoLAR_ws/console_ui/devel/setup.bash
source ~/catkin_ws/devel/setup.bash
#source ~/ws_TP/devel/setup.bash
#source ~/ws_JWT_TP/devel/setup.bash
#source ~/ws_qt_TP/devel/setup.bash

#alias
alias python='python3'
alias pip='pip3'

alias rm='rm -rf'

alias SOURCE='source devel/setup.bash'

alias LAUNCH_jcolar_engine_staubli='source ~/JCoAR_ws/taskscript_engine/devel/setup.bash;roslaunch jcolar_engine scriptEngine_staubli.launch'
alias LAUNCH_jcolar_console_staubli='source ~/JCoLAR_ws/console_ui/devel/setup.bash;roslaunch jcolar_console jcolar_console_staubli.launch'

alias BUILD_JCOLAR_TP='cd ~/JCoLAR_TP/;rm -rf build/ devel/;catkin_make'

alias LAUNCH_setup_TP='source ~/JCoLAR_TP/devel/setup.bash;roslaunch TP_setup TP_setup.launch'
alias LAUNCH_TP='source ~/JCoLAR_TP/devel/setup.bash;roslaunch TP_launcher TP_launcher.launch'

alias BUILD_JWT_TP='cd ~/TP_ws/;rm -rf devel/ build/;catkin_make'

alias LAUNCH_SIMULATION='source ~/TP_ws/devel/setup.bash;roslaunch ur10_moveit_config demo.launch'

alias LAUNCH_JWT_TP_FUL='source ~/TP_ws/devel/setup.bash;roslaunch rtp_gui ros_qt_gui_full.launch'
alias LAUNCH_JWT_TP_MAX='source ~/TP_ws/devel/setup.bash;roslaunch rtp_gui ros_qt_gui_max.launch'
alias LAUNCH_JWT_TP_MIN='source ~/TP_ws/devel/setup.bash;roslaunch rtp_gui ros_qt_gui_min.launch'
alias LAUNCH_JWT_TP_NOM='source ~/TP_ws/devel/setup.bash;roslaunch rtp_gui ros_qt_gui_nomal.launch'

alias LAUNCH_TEST_TP_FUL='source ~/TP_ws/devel/setup.bash;roslaunch ros_qt_gui ros_qt_gui_full.launch'
alias LAUNCH_TEST_TP_MAX='source ~/TP_ws/devel/setup.bash;roslaunch ros_qt_gui ros_qt_gui_max.launch'
alias LAUNCH_TEST_TP_MIN='source ~/TP_ws/devel/setup.bash;roslaunch ros_qt_gui ros_qt_gui_min.launch'
alias LAUNCH_TEST_TP_NOM='source ~/TP_ws/devel/setup.bash;roslaunch ros_qt_gui ros_qt_gui_normal.launch'

alias eb='vim ~/.bashrc'
alias sb='source ~/.bashrc'

alias gs='git status'
alias gp='git pull'

alias cw='cd ~/catkin_ws'
alias cs='cd ~/catkin_ws/src'
alias ccp='catkin_create_pkg'
alias cm='catkin_make'
alias CM='rm -rf devel/ build/;catkin_make'
alias cb='catkin build'

#export
export TURTLEBOT3_MODEL=burger
export SVGA_VGPU10=0


:<<'END'
#JCoLAR robostar
########################################################
# ROS Multi-package config

export ROS_PKG_1=${HOME}/user/JCoLAR_ws/taskscript_engine
ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$ROS_PKG_1/src
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROS_PKG_1/devel/lib
ROSLISP_PACKAGE_DIRECTORIES=$ROSLISP_PACKAGE_DIRECTORIES:$ROS_PKG_1/devel/share/common-lisp
PYTHONPATH=$PYTHONPATH:$ROS_PKG_1/devel/lib/python2.7/dist-packages
PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$ROS_PKG_1/devel/lib/pkgconfig
CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$ROS_PKG_1/devel

export ROS_PKG_2=${HOME}/user/JCoLAR_ws/ws_rosi
ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$ROS_PKG_2/src
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROS_PKG_2/devel/lib
ROSLISP_PACKAGE_DIRECTORIES=$ROSLISP_PACKAGE_DIRECTORIES:$ROS_PKG_2/devel/share/common-lisp
PYTHONPATH=$PYTHONPATH:$ROS_PKG_2/devel/lib/python2.7/dist-packages
PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$ROS_PKG_2/devel/lib/pkgconfig
CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$ROS_PKG_2/devel
#
########################################################



use_jcolarengine=1

if [ ${use_jcolarengine} -eq 1 ];then
        ########################################################
        # ROS Multi-package config
        export ROS_PKG_1=${HOME}/user/JCoLAR_ws/taskscript_engine
        export ROS_PKG_2=${HOME}/user/JCoLAR_ws/external_wrappers
        export ROS_PKG_3=${HOME}/user/JCoLAR_ws/console_ui
        export ROS_PKG_4=${HOME}/user/ws_rosi

        ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$ROS_PKG_1/src
        ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$ROS_PKG_2/src
        ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$ROS_PKG_3/src
        ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$ROS_PKG_4/src

        LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROS_PKG_1/devel/lib
        LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROS_PKG_2/devel/lib
        LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROS_PKG_3/devel/lib
        LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROS_PKG_4/devel/lib

        ROSLISP_PACKAGE_DIRECTORIES=$ROSLISP_PACKAGE_DIRECTORIES:$ROS_PKG_1/devel/share/common-lisp
        ROSLISP_PACKAGE_DIRECTORIES=$ROSLISP_PACKAGE_DIRECTORIES:$ROS_PKG_2/devel/share/common-lisp
        ROSLISP_PACKAGE_DIRECTORIES=$ROSLISP_PACKAGE_DIRECTORIES:$ROS_PKG_3/devel/share/common-lisp
        ROSLISP_PACKAGE_DIRECTORIES=$ROSLISP_PACKAGE_DIRECTORIES:$ROS_PKG_4/devel/share/common-lisp

        PYTHONPATH=$PYTHONPATH:$ROS_PKG_1/devel/lib/python2.7/dist-packages
        PYTHONPATH=$PYTHONPATH:$ROS_PKG_2/devel/lib/python2.7/dist-packages
        PYTHONPATH=$PYTHONPATH:$ROS_PKG_3/devel/lib/python2.7/dist-packages
        PYTHONPATH=$PYTHONPATH:$ROS_PKG_4/devel/lib/python2.7/dist-packages

        PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$ROS_PKG_1/devel/lib/pkgconfig
        PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$ROS_PKG_2/devel/lib/pkgconfig
        PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$ROS_PKG_3/devel/lib/pkgconfig
        PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$ROS_PKG_4/devel/lib/pkgconfig

        CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$ROS_PKG_1/devel
        CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$ROS_PKG_2/devel
        CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$ROS_PKG_3/devel
        CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$ROS_PKG_4/devel
        #
        ########################################################
fi
END

#:<<'END'
#JCoLAR Staubli
######################################################
### for ROS Multi Package Configure
use_pickit=1
set_roscfg=1

if [ ${use_pickit} -eq 1 ];then
	export ROS_IP=localhost
	export ROS_MASTER_URI=http://localhost:11311
else
	export ROS_IP=192.168.50.45
	export ROS_MASTER_URI=http://192.168.50.62:11311
fi



if [ ${set_roscfg} -eq 1 ];then
########################################################
## ROS Multi-package config
export ROS_PKG_1=/home/user/JCoLAR_ws/taskscript_engine
export ROS_PKG_2=/home/user/JCoLAR_ws/external_wrappers
export ROS_PKG_4=/home/user/JCoLAR_ws/console_ui
export ROS_PKG_3=/home/user/ws_rosi

ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$ROS_PKG_1/src
ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$ROS_PKG_2/src
ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$ROS_PKG_3/src
ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$ROS_PKG_4/src

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROS_PKG_1/devel/lib
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROS_PKG_2/devel/lib
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROS_PKG_3/devel/lib
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROS_PKG_4/devel/lib

ROSLISP_PACKAGE_DIRECTORIES=$ROSLISP_PACKAGE_DIRECTORIES:$ROS_PKG_1/devel/share/common-lisp
ROSLISP_PACKAGE_DIRECTORIES=$ROSLISP_PACKAGE_DIRECTORIES:$ROS_PKG_2/devel/share/common-lisp
ROSLISP_PACKAGE_DIRECTORIES=$ROSLISP_PACKAGE_DIRECTORIES:$ROS_PKG_3/devel/share/common-lisp
ROSLISP_PACKAGE_DIRECTORIES=$ROSLISP_PACKAGE_DIRECTORIES:$ROS_PKG_4/devel/share/common-lisp

PYTHONPATH=$PYTHONPATH:$ROS_PKG_1/devel/lib/python2.7/dist-packages
PYTHONPATH=$PYTHONPATH:$ROS_PKG_2/devel/lib/python2.7/dist-packages
PYTHONPATH=$PYTHONPATH:$ROS_PKG_3/devel/lib/python2.7/dist-packages
PYTHONPATH=$PYTHONPATH:$ROS_PKG_4/devel/lib/python2.7/dist-packages

PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$ROS_PKG_1/devel/lib/pkgconfig
PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$ROS_PKG_2/devel/lib/pkgconfig
PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$ROS_PKG_3/devel/lib/pkgconfig
PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$ROS_PKG_4/devel/lib/pkgconfig

CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$ROS_PKG_1/devel
CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$ROS_PKG_2/devel
CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$ROS_PKG_3/devel
CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$ROS_PKG_4/devel
########################################################
fi

#END
#source ~/ws_moveit/devel/setup.bash

#git_token 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
