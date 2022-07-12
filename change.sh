#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
echo -e ""
echo -e "======================================"
echo -e "               ${green}CHANGE PORT${NC} "
echo -e "======================================"
echo -e ""
echo -e "     [  1 ]  CHANGE PORT V2RAY VMESS"
echo -e "     [  2 ]  CHANGE PORT V2RAY VLESS"
echo -e "     [  3 ]  CHANGE PORT XRAY VMESS"
echo -e "     [  4 ]  CHANGE PORT XRAY VLESS"
echo -e "     [  5 ]  CHANGE PORT XRAY XTLS"
echo -e "     [  6 ]  CHANGE PORT XRAY GRPC"
echo -e "======================================"
echo -e "     ${green}[  0 ]  EXIT TO MENU${NC}"
echo -e "======================================"
echo -e "\e[1;31m"
read -p "     Select From Options [1-8 or 0] :  " port
echo -e "\e[0m"
case $port in
1)
port-ws
;;
2)
port-vless
;;
3)
port-xvmess
;;
4)
port-xvless
;;
5)
port-xtls
;;
6)
port-grpc
;;
0)
clear
menu
;;
*)
echo "Please enter an correct number"
sleep 1
clear
change
;;
esac
