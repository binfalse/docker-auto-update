# Docker Auto-Update

<a href="https://binfalse.de/2017/01/24/automatically-update-docker-images//"><img src="https://binfalse.de/assets/media/pics/2017/docker-auto-update.png"  title="Automatically Update your Docker Images" width="200px"></a>

This is a tool that helps you keeping your Docker images and containers up-to-date.
It basically consists of two files:

* [`/etc/cron.daily/docker-updater.sh` is the main script.](etc/cron.daily/docker-updater.sh) Placed in `/etc/cron.daily` it will regularly check for updates of your images.
* [`/etc/docker-compose-auto-update.conf` lists Docker Compose environments.](etc/docker-compose-auto-update.conf) Add the paths to the `docker-compose.yml` files on your system, one per line. It will be read by the `docker-updater.sh` script and containers will be updated automatically.


You'll find [more information on the Docker Auto-Update tool in my blog](https://binfalse.de/2017/01/24/automatically-update-docker-images/).

## Installation

To install the Docker Auto-Update tool, you may clone the [git repository at GitHub](https://github.com/binfalse/docker-auto-update).
Then move the `docker-updater.sh` script to `/etc/cron.daily/docker-updater.sh` and create a list of Docker Compose config files in `/etc/docker-compose-auto-update.conf` - one path to a `docker-compose.yml` per line.


If you're running a Debian-based system, you may instead [use my apt-repository to install the Docker-Tools](https://binfalse.de/software/apt-repo/).
In that case you just need to run

    aptitude install bf-docker-tools

and you'll always stay up-to-date with bug fixes and new features :)


## Licence

    Docker-Tools - a suite of tools for easier dockering
    Copyright (C) 2016-2017 Martin Scharm <https://binfalse.de/contact/>
    
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

