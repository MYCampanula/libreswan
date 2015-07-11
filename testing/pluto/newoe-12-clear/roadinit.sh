/testing/guestbin/swan-prep
cp policies/* /etc/ipsec.d/policies/
ipsec setup start
# ensure for tests acquires expire before our failureshunt=2m
echo 30 > /proc/sys/net/core/xfrm_acq_expires
/testing/pluto/bin/wait-until-pluto-started
# give OE policies time to load
sleep 5
ip -s xfrm monitor > /tmp/xfrm-monitor.out &
echo "initdone"
