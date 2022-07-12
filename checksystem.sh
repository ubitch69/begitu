#!/bin/bash                                                                             
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'  


echo -e  "  "
echo -e  " ═══════════════════════════════════════════════════ "
echo -e  " ${green}CHECK SYSTEM ERROR${NC} "       
echo -e  " ═══════════════════════════════════════════════════ "                            
echo -e  "  "                                                                            
                                                                            
status="$(systemctl show nginx.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " NGINX              : NGINX Service is "$green"running"$NC""                
else                                                                                    
echo -e " NGINX              : NGINX Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show v2ray@none.service --no-page)"                                 
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " VMESS NON TLS      : VMESS NON TLS Service is "$green"running"$NC""              
else                                                                                    
echo -e " VMESS NON TLS      : VMESS NON TLS Service is "$red"not running (Error)"$NC""    
fi                                                                                      

status="$(systemctl show v2ray.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " VMESS TLS          : VMESS TLS  Service is "$green"running"$NC""                
else                                                                                    
echo -e " VMESS TLS          : VMESS TLS  Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show v2ray@vless.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " VLESS TLS          : VLESS TLS Service is "$green"running"$NC""                
else                                                                                    
echo -e " VLESS TLS          : VLESS TLS Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show v2ray@vnone.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " VLESS NON TLS      : VLESS NON TLS  Service is "$green"running"$NC""                
else                                                                                    
echo -e " VLESS NON TLS      : VLESS NON TLS  Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show xray@v2ray-nontls --no-page)"                                 
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " XRAY VMESS NON TLS : XRAY VMESS NON TLS Service is "$green"running"$NC""              
else                                                                                    
echo -e " XRAY VMESS NON TLS  : XRAY VMESS NON TLS Service is "$red"not running (Error)"$NC""    
fi                                                                                      

status="$(systemctl show xray@v2ray-tls --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " XRAY VMESS TLS     : XRAY VMESS TLS  Service is "$green"running"$NC""                
else                                                                                    
echo -e " XRAY VMESS TLS      : XRAY VMESS TLS  Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show xray@vless-tls --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " XRAY VLESS TLS     : XRAY VLESS TLS Service is "$green"running"$NC""                
else                                                                                    
echo -e " XRAY VLESS TLS     : XRAY VLESS TLS Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show xray@vless-nontls --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " XRAY VLESS NON TLS : XRAY VLESS NON TLS  Service is "$green"running"$NC""                
else                                                                                    
echo -e " XRAY VLESS NON TLS : XRAY VLESS NON TLS  Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show xray@vless-direct --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " XRAY VLESS XTLS    : XRAY VLESS XTLS  Service is "$green"running"$NC""                
else                                                                                    
echo -e " XRAY VLESS XTLS    : XRAY VLESS XTLS  Service is "$red"not running (Error)"$NC""
fi

status="$(systemctl show xray@vless-grpc --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " XRAY VLESS GRPC    : XRAY VLESS GRPC  Service is "$green"running"$NC""                
else                                                                                    
echo -e " XRAY VLESS GRPC    : XRAY VLESS GRPC  Service is "$red"not running (Error)"$NC""      
fi
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu