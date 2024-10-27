 sudo nano /etc/asterisk/pjsip.conf

 sudo nano /etc/asterisk/extensions.conf

 sudo asterisk -rvvv

  sudo asterisk -rx "core reload"

  sudo systemctl restart asterisk

  ps aux | grep asterisk

  #

  ip addr flush dev eth0

  sudo ip addr flush dev eth0

   sudo ip addr add 192.168.8.124/24 dev eth0

sudo ip route add default via 192.168.8.254 dev eth0
 
 