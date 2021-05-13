FROM dorowu/ubuntu-desktop-lxde-vnc:latest

#Switching sources.list for complete 20.04 one.
RUN sudo mv /etc/apt/sources.list /etc/apt/sources.list.old
COPY sources.list /etc/apt/sources.list

#Removing build-in browsers
RUN sudo dpkg --remove firefox google-chrome-stable && sudo apt-get -y autoremove

#Updating and installing basic tools
RUN sudo apt-get update -y && sudo apt-get upgrade -y
RUN sudo apt-get install -y vim ssh git apt-transport-https software-properties-common build-essential wget curl zip unzip htop

#Adding Pale Moon browser (https://www.palemoon.org/)
RUN echo 'deb http://download.opensuse.org/repositories/home:/stevenpusser/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:stevenpusser.list
RUN curl -fsSL https://download.opensuse.org/repositories/home:stevenpusser/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_stevenpusser.gpg > /dev/null
RUN sudo apt-get update -y
RUN sudo apt-get install -y palemoon