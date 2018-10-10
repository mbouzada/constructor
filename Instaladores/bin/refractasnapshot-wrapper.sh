#!/usr/bin/env bash
#
# Wrapper for refractasnapshot-gui

command="/usr/bin/refractasnapshot-gui -d"

# I hope nobody uses this, but it's here
# in case you're running a root xsession.
if [[ $(id -u) -eq 0 ]] ; then
	"$command"
	exit 0
fi

# This will be used to test for sudo nopasswd.
sudo_allowed=$(sudo -n uptime 2>&1 | grep load | wc -l)

if [[ -e $(which gksu) ]] ; then
	gksu "$command"
elif
	[[ -e $(which kdesu) ]] ; then
	kdesu "$command"
elif
	[[ -e $(which kdesudo) ]] ; then
	kdesudo "$command"
elif
	#another way to do it
	[[ -e $(which tdesu) ]] ; then
	tdesu "$command"
elif
	[[ -e $(which ktsuss) ]] ; then
	ktsuss "$command" 
elif
	# for sudo with no password
	[[ $sudo_allowed -ne 0 ]] ; then
		sudo "$command"
elif
	# for sudo with password
	$(groups $USER | grep -qs sudo); then
	xterm -fa mono -fs 12 -e  "sudo $command" 
else
	xterm -fa mono -fs 12 -e su -c "$command"
fi

exit 0
