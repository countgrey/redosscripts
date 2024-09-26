#!/bin/bash

cp -ar sshd_config /etc/ssh/sshd_config
systemctl enable --now sshd
