#!/bin/bash
set -e

sleep 10
trytond-admin -c /etc/tryton/trytond.conf -d tryton -p --all

