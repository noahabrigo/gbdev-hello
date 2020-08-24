#!/bin/bash
clear
rgbasm -o main.o game.asm
rgblink -o game.gb main.o
rgbfix -v -p 0 game.gb
open game.gb