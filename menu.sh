#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
blue='\e[0;34m'
blue_b='\e[0;94m'
NC='\e[0m'

echo -e  " "
echo -e  " ${red}═════════════════════════════════════════════════════════════════ "
echo -e  "                       • SERVER INFORMATION •"
echo -e  " ${red}═════════════════════════════════════════════════════════════════ "
echo -e  " ${blue}OS VERSION                  : `hostnamectl | grep "Operating System" | cut -d ' ' -f5-`"${NC}
echo -e  " ${blue}KERNEL VERSION              : `uname -r`${NC}"
echo -e  " "
echo -e  " ${red}═════════════════════════════════════════════════════════════════ "
echo -e  "                          • MAIN MENU • "                                       
echo -e  " ${red}═════════════════════════════════════════════════════════════════ "
echo -e  " ${blue}[  1 ] V2RAY CORE" 
echo -e  " ${blue}[  2 ] XRAY CORE" 
echo -e  " " 
echo -e  " ${red}═════════════════════════════════════════════════════════════════ "
echo -e  "                         • SYSTEM MENU • "       
echo -e  " ${red}═════════════════════════════════════════════════════════════════ "                           
echo -e  " ${blue}[  8 ] ADD/CHANGE DOMAIN VPS"
echo -e  " [  3 ] CHANGE PORT SERVICE"
echo -e  " [  4 ] CHANGE DNS SERVER"
echo -e  " [  5 ] RENEW V2RAY AND XRAY CERTIFICATION"
echo -e  " [  6 ] REBOOT VPS"
echo -e  " [  7 ] SPEEDTEST VPS"
echo -e  " [  8 ] CHECK SERVICE ERROR"
echo -e  " [  0 ] EXIT MENU${NC} "
echo -e  " "
echo -e  " ${red}═════════════════════════════════════════════════════════════════" 
echo -e  " Premium Script By Reyz-V4"
echo -e  " Thank You For Using Script By Reyz-V4"
echo -e  " ${red}═════════════════════════════════════════════════════════════════"
echo -e  "  "
echo -e "\e[1;31m"
read -p  "     Please select an option :  " menu
echo -e "\e[0m"
 case $menu in
   1)
   mv2raycore
   ;;
   2)
   mxraycore
   ;;
   3)
   add-host
   ;;
   3)
   change
   ;;
   4)
   mdns
   ;;
   5)
   recert-xrayv2ray
   ;;
   6)
   reboot
   ;;
   7)
   speedtest
   ;;
   8)
   checksystem  
   ;;
   0)
   sleep 0.5
   clear
   jinggo
   ;;
   *)
   echo -e "ERROR!! Please Enter an Correct Number"
   sleep 1
   clear
   menu
   ;;
   esac