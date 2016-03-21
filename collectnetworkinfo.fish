#! /usr/local/bin/fish

set IP4FW /sbin/iptables
set IP6FW /sbin/ip6tables
set LSPCI /usr/bin/lspci
set ROUTE /sbin/route
set NETSTAT /bin/netstat
set LSB /usr/bin/lsb_release
set  

## files ##
set DNSCLIENT "/etc/resolv.conf"
set DRVCONF "/etc/modprobe.conf"
set NETALIASCFC "/etc/sysconfig/network-scripts/ifcfg-eth?-range?"
set NETCFC "/etc/sysconfig/network-scripts/ifcfg-eth?"
set NETSTATICROUTECFC "/etc/sysconfig/network-scripts/route-eth?"
set SYSCTL "/etc/sysctl.conf"
 
## Output file ##
set OUTPUT "network.$(date +'%d-%m-%y').info.txt"
 
## Email info to?? ##
set SUPPORT_ID "your_name@service_provider.com"


function chk_root
  set -l meid (id -u)
  if test $meid -ne 0
    echo "You must be root user to run this tool"
    exit 999
  end
end

 
function write_header
  echo "---------------------------------------------------" >> $OUTPUT
  echo "$@" >> $OUTPUT
  echo "---------------------------------------------------" >> $OUTPUT
end
 
function dump_info
  echo "* Hostname: "(hostname) >$OUTPUT
  echo "* Run date and time: "(date) >>$OUTPUT
   
  write_header "Linux Distro"
  echo "Linux kernel: "(uname -mrs) >>$OUTPUT
  $LSB -a >> $OUTPUT  

  [ -x ${HWINF} ] && write_header "${HWINF}"
  [ -x ${HWINF} ] && ${HWINF} >> $OUTPUT
   
  [ -x ${HWINF} ] && write_header "${HWINF}"
  [ -x ${HWINF} ] && ${HWINF} >> $OUTPUT
   
  write_header "PCI Devices"
  ${LSPCI} -v >> $OUTPUT
   
  write_header "$IFCFG Output"
  $IFCFG >> $OUTPUT
   
  write_header "Kernel Routing Table"
  $ROUTE -n >> $OUTPUT
   
  write_header "Network Card Drivers Configuration $DRVCONF"
  [ -f $DRVCONF ] && grep eth $DRVCONF >> $OUTPUT || echo "Error $DRVCONF file not found." >> $OUTPUT
   
  write_header "DNS Client $DNSCLIENT Configuration"
  [ -f $DNSCLIENT ] && cat $DNSCLIENT >> $OUTPUT || echo "Error $DNSCLIENT file not found." >> $OUTPUT
   
  write_header "Network Configuration File"
  for f in $NETCFC
  do
  if [ -f $f ]
  then
  echo "** $f **" >> $OUTPUT
  cat $f >> $OUTPUT
  else
  echo "Error $f not found." >> $OUTPUT
  fi
  done
   
  write_header "Network Aliase File"
  for f in $NETALIASCFC
  do
  if [ -f $f ]
  then
  echo "** $f **" >> $OUTPUT
  cat $f >> $OUTPUT
  else
  echo "Error $f not found." >> $OUTPUT
  fi
  done
   
  write_header "Network Static Routing Configuration"
  for f in $NETSTATICROUTECFC
  do
  if [ -f $f ]
  then
  echo "** $f **" >> $OUTPUT
  cat $f >> $OUTPUT
  else
  echo "Error $f not found." >> $OUTPUT
  fi
  done
   
  write_header "IP4 Firewall Configuration"
  $IP4FW -L -n >> $OUTPUT
   
  write_header "IP6 Firewall Configuration"
  $IP6FW -L -n >> $OUTPUT
   
  write_header "Network Stats"
  $NETSTAT -s >> $OUTPUT
   
  write_header "Network Tweaks via $SYSCTL"
  [ -f $SYSCTL ] && cat $SYSCTL >> $OUTPUT || echo "Error $SYSCTL not found." >>$OUTPUT
   
  echo "The Network Configuration Info Written To $OUTPUT. Please email this file to $SUPPORT_ID."
end
 
chk_root
dump_info

