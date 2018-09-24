#!/bin/bash

sudo apt install -y x11vnc &&
sudo mkdir /etc/x11vnc &&
sudo x11vnc --storepasswd /etc/x11vnc/vncpwd &&
sudo echo "[Unit]
Description=VNC Server for X11
Requires=display-manager.service
After=display-manager.service
[Service]
Type=forking
ExecStart=/usr/bin/x11vnc -dontdisconnect -auth guess -forever -shared -noxdamage -repeat -rfbauth /etc/x11vnc/vncpwd -rfbport 5900 -bg -o /var/log/x11vnc.log
ExecStop=/usr/bin/killall x11vnc
Restart=on-failure
Restart-sec=5

[Install]
WantedBy=multi-user.target" > /lib/systemd/system/x11vnc.service &&
sudo cp /lib/systemd/system/x11vnc.service /etc/systemd/system/ &&
sudo echo "# This file is part of systemd.
#
# systemd is free software; you can redistribute it and/or modify it
# under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation; either version 2.1 of the License, or
# (at your option) any later version.
[Unit]
Description=Graphical Interface
Documentation=man:systemd.special(7)
Requires=multi-user.target
Wants=display-manager.service x11vnc.service
Conflicts=rescue.service rescue.target
After=multi-user.target rescue.service rescue.target display-manager.service
AllowIsolate=yes" > /lib/systemd/system/graphical.target &&
sudo cp /lib/systemd/system/graphical.target /etc/systemd/system/ &&
sudo systemctl daemon-reload &&
sudo systemctl enable graphical.target &&
sudo systemctl start x11vnc.service &&
sudo ufw enable
