#!/bin/bash
# Purpose: To install basic packages based on the operating system
# Author : Manoj Ravuri 
# Creation Date :12-05-2020
# Version : 1
os=$(sudo cat /etc/os-release | awk -F '"' 'NR==1 {print $2}')
packages=(git vim curl tree wget net-tools python3 python3-pip screenfetch)
echo "Operating System is : $os"

if [ $os == 'Ubuntu' ]
then
   pm=apt-get
   packages=("${packages[@]}" apache2)
   echo "** Installing packages for $os"
   for i in ${packages[*]}
   do
     which $i &> /dev/null
     if [ $? -eq 0 ]
     then
	 echo "$i is already installed"
     else
	 sudo $pm install -y $i
	 echo "----------------------"
	 echo "$i is installed sucessfully"
    fi
  done
else
   pm=yum
   packages=("${packages[@]}" httpd)
   echo "** Installing packages for $os"
   for i in ${packages[*]}
   do
     which $i &> /dev/null
     if [$? -eq 0 ]
     then
         echo "$i is already installed"
     else
         sudo $pm install -y $i
         echo "----------------------"
         echo "$i is installed sucessfully"
    fi
  done

fi

