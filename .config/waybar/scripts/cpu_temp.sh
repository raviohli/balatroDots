#!/bin/bash
sensors | awk '/asusec-isa-000a/,0' | awk '/CPU:/ { print int ($2) "°C"; exit }'