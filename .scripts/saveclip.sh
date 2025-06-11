#!/bin/bash

killall -SIGUSR1 gpu-screen-recorder
notify-send -a aurora "Clip Saved ~/Videos/clips"
