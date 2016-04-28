# YoubotVMInstallation
Describes how to install the Youbot API in a Vagrant Virtualbox virtual machine using Ubuntu 14.04 and ROS Indigo.

## Prerequisite
* Install Virtualbox (https://www.virtualbox.org/wiki/Downloads)
* Install Vagrant (https://www.vagrantup.com/downloads.html)

## Creation of the virtual machine
Here is a video explaining how to do so :  

[![http://www.youtube.com/watch?v=7r9PNTvIe3s](http://img.youtube.com/vi/7r9PNTvIe3s/0.jpg)](http://www.youtube.com/watch?v=7r9PNTvIe3s)  

Or here briefly if you are familiar with Vagrant and Virtualbox, type :  
`cd <yourDirectory>`  
`vagrant init shadowrobot/ros-indigo-desktop-xfce-trusty64.box`  
`vagrant up`  

Note : Log in using the ROS user with the password ros  

Stop your machine and go in the configuration of you virtual machine in virtualbox to put 2048 Mo in RAM  
![alt text][logo]
[logo]: https://github.com/JulV94/YoubotVMInstallation/raw/master/RAMScreenshot.png "virtualbox config img"

## When you're in your virtual machine
* Update your system  
`sudo apt-get update && sudo apt-get upgrade`
* launch the script from this repo  
`git clone https://github.com/JulV94/YoubotVMInstallation.git`  
`cd YoubotVMInstallation`  
`chmod +x youbot_setup.sh`  
`./youbot_setup.sh`  

Note : The script will ask for the ROS user password maybe several times so stay there to give it

## Install an IDE to code in C++ with ROS and Youbot
Here is a link to configure Codeblocks or QtCreator  
http://www.ciencia-explicada.com/2014/12/ros-how-to-develop-catkin-packages-from-an-ide.html
