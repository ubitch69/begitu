#!/bin/bash

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# install wget and curl
apt -y install wget curl

# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl git lsof
echo "clear" >> .profile

# install fail2ban
apt -y install fail2ban

#install ddos
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.ctohome.com/linux-vps-pack/soft/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.ctohome.com/linux-vps-pack/soft/ddos/ignore.ip.list

/sbin/ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:" >>  /usr/local/ddos/ignore.ip.list;
chattr +i /usr/local/ddos/ignore.ip.list;

echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.ctohome.com/linux-vps-pack/soft/ddos/ddos-deflate.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'

echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'DOS-Deflate Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'

service iptables restart

clear

# block torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# download script menu
echo -e "============================================="
echo -e " ${green} DOWNLOAD MENU SCRIPT ${NC}"
echo -e "============================================="
sleep 2
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/ubitch69/begitu/main/menu.sh"
wget -O add-host "https://raw.githubusercontent.com/ubitch69/loh/main/add-host.sh"
wget -O member "https://raw.githubusercontent.com/ubitch69/loh/main/member.sh"
wget -O delete "https://raw.githubusercontent.com/ubitch69/loh/main/delete.sh"
wget -O speedtest "https://raw.githubusercontent.com/ubitch69/loh/main/speedtest_cli.py"
wget -O renew "https://raw.githubusercontent.com/ubitch69/loh/main/renew.sh"
wget -O change "https://raw.githubusercontent.com/ubitch69/loh/main/change.sh"
wget -O xp "https://raw.githubusercontent.com/ubitch69/begitu/main/xp.sh"
wget -O checksystem "https://raw.githubusercontent.com/ubitch69/begitu/main/checksystem.sh"
wget -O mdns "https://raw.githubusercontent.com/ubitch69/loh/main/mdns.sh"
chmod +x menu
chmod +x add-host
chmod +x member
chmod +x delete
chmod +x speedtest
chmod +x renew
chmod +x change
chmod +x xp
chmod +x checksystem
chmod +x mdns
echo "0 5 * * * root clear-log && reboot" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab
# remove unnecessary files
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y

# finishing
cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh

# finihsing
clear
