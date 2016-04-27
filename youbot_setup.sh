#!/bin/bash

# initializes the youbot api and create the catkin workspace in a ROS Indigo environement
# Author : Julien Van Loo
# Date : 27/04/2016
# Version 1.0

# Update computer
echo -e "\e[100m[Installing needed dependencies...]\e[49m"
sudo apt-get -y install libsdl1.2-dev libncurses5-dev
# Update ROS dependencies
echo -e "\e[100m[Update ROS dependencies...]\e[49m"
rosdep update
# Creating catkin workspace
echo -e "\e[100m[Creating catkin workspace...]\e[49m"
mkdir -p $HOME/catkin_ws/src
cd $HOME/catkin_ws/src
catkin_init_workspace
cd $HOME/catkin_ws/
catkin_make
source $HOME/catkin_ws/devel/setup.bash
echo "source ~/catkin_ws/devel/setup.bash" >> $HOME/.bashrc
# ROS wrapper
echo -e "\e[100m[ROS Wrapper for Youbot API...]\e[49m"
sudo apt-get -y install ros-indigo-youbot-driver-ros-interface ros-indigo-youbot-description
sudo setcap cap_net_raw+ep /opt/ros/indigo/lib/youbot_driver_ros_interface/youbot_driver_ros_interface
sudo ldconfig /opt/ros/indigo/lib
# Youbot API
echo -e "\e[100m[Installing Youbot API...]\e[49m"
sudo -y apt-get install ros-indigo-youbot-driver
sudo ldconfig /opt/ros/indigo/lib
# Creating Hello World example
echo -e "\e[100m[Creating Hello World example...]\e[49m"
cd $HOME/catkin_ws/src
git clone https://github.com/wnowak/youbot_applications
# Remove android stuff that doesn't compile
cd $HOME/catkin_ws/src/youbot_applications/
rm -rf android_app_pc_client/
cd $HOME/catkin_ws
catkin_make
# Usage : rosrun hello_world_demo youBot_HelloWorldDemo
# Installing Gazebo for Youbot API
echo -e "\e[100m[Installing Gazebo for Youbot API...]\e[49m"
sudo apt-get -y install ros-indigo-ros-control ros-indigo-ros-controllers ros-indigo-gazebo-ros-control
cd $HOME/catkin_ws/src
git clone http://github.com/youbot/youbot_description.git -b indigo-devel
git clone http://github.com/youbot/youbot_simulation.git
cd $HOME/catkin_ws
catkin_make
# Usage : roslaunch youbot_gazebo_robot youbot.launch
echo -e "\e[100mUsage of Hello World code : rosrun hello_world_demo youBot_HelloWorldDemo\e[49m"
echo -e "\e[100mUsage of Gazebo for Youbot : roslaunch youbot_gazebo_robot youbot.launch\e[49m"
