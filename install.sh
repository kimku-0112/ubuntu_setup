#!/bin/bash

# apt update & upgrade
printf "\n\n======================== apt update & upgrade ========================\n\n"
sudo apt update
sudo apt upgrade 

# vmtools (VMware 전체화면 및 기기 관리)
printf "\n\n======================== vmtools (VMware 전체화면 및 기기 관리) ========================\n\n"
sudo apt -y install open-vm-tools
sudo apt -y install open-vm-tools-desktop 

# install curl
printf "\n\n======================== install curl ========================\n\n"
sudo apt -y install curl

# install git
printf "\n\n======================== install git ========================\n\n"
sudo apt -y install git

# install vim
printf "\n\n======================== install vim ========================\n\n"
sudo apt -y install vim

# install terminator
printf "\n\n======================== install terminator ========================\n\n"
sudo apt -y install terminator

# install VScode
printf "\n\n======================== install VScode ========================\n\n"
sudo apt update
sudo sh -c 'curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg' 
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' 
sudo apt -y install code 

# install ROS
printf "\n\n======================== install ROS ========================\n\n"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update
sudo apt -y install ros-kinetic-desktop-full
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt -y install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo apt -y install python-rosdep
sudo rosdep init
rosdep update

# install MOVEIT
printf "\n\n======================== install MOVEIT ========================\n\n"
rosdep update
sudo apt update
sudo apt dist-upgrade
sudo apt -y install ros-kinetic-catkin python-catkin-tools
sudo apt -y install ros-kinetic-moveit

# install ros pkg
printf "\n\n======================== install ros pkg ========================\n\n"
sudo apt -y install ros-kinetic-ros-control ros-kinetic-ros-controllers 
sudo apt -y install ros-kinetic-moveit-planners* 

# install fcitx hangul
printf "\n\n======================== install fcitx hangul ========================\n\n"
sudo apt -y install fcitx-hangul

# download T/P pkg 
printf "\n\n======================== download T/P pkg  ========================\n\n"
# git token 필요
mkdir -p ~/TP_ws/src
cd ~/TP_ws/src
git clone https://github.com/kimku-0112/Teaching_pendant.git

# qt creator 설치 (download site :  https://ros-qtc-plugin.readthedocs.io/en/latest/_source/How-to-Install-Users.html )

# install Vim
printf "\n\n======================== install Vim ========================\n\n"
sudo apt -y install vim  

# vim plugin 관리 툴 bundle설치 
printf "\n\n======================== vim plugin 관리 툴 bundle설치  ========================\n\n"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 

# install jellybeans style
printf "\n\n======================== install jellybeans style ========================\n\n"
mkdir -p ~/.vim/colors 
cd ~/.vim/colors 
curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim 

# ubuntu 16.04 alt tab 이상증세 해결
#printf "\n\n======================== ubuntu 16.04 alt tab 이상증세 해결 ========================\n\n"
#sudo apt -y install compizconfig-settings-manager
# ccsm으로 실행
# Window management tap 에 application switcher 왼쪽에 check box 해제 

# reboot
printf "\n\n======================== reboot ========================\n\n"
sudo reboot
