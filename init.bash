#!/bin/bash
cd "$(dirname "$0")"

( source ./dns/setup.bash )
( source ./dhcp/setup.bash )