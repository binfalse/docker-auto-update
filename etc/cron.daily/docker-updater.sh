#!/bin/bash
#
# Copyright 2016-2017  Martin Scharm
#
# This file is part of bf-docker-tools.
# <https://github.com/binfalse/docker-tools>
# <https://binfalse.de/2016/12/03/handy-docker-tools/>
# <https://binfalse.de/2017/01/24/automatically-update-docker-images/>
# <https://github.com/binfalse/docker-auto-update>
#
# bf-docker-tools is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option) any
# later version.
#
# bf-docker-tools is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

# You should have received a copy of the GNU General Public License along with
# bf-docker-tools. If not, see <http://www.gnu.org/licenses/>.

# set to 1 to get some debugging output
DEBUG=0

# list of docker-compose configs
DCOMPOSE=/etc/docker-compose-auto-update.conf


# update all docker images
if [ "$DEBUG" -eq 1 ]
then
	/usr/local/bin/dupdate
else
	/usr/local/bin/dupdate -s
fi


# update all docker compose scripts 
if [ -e "$DCOMPOSE" ]
then
	cat "$DCOMPOSE" | /bin/grep -v '^#' | \
	while read conf
	do
		if [ "$DEBUG" -eq 1 ]
		then
			echo "updating docker compose in "
			docker-compose -f $conf up -d --remove-orphans 2>&1
		else
			docker-compose -f $conf up -d --remove-orphans 2>&1 | /bin/grep -v up-to-date
		fi
	done
fi



