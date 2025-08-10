#!/usr/bin/env bash
set -e
systemctl start apache2
systemctl is-active --quiet apache2
