#Ev3: Lego Robotics in Elixir

## THIS REPO IS NOW OBSOLETE

Goto https://github.com/StarlitSoftware/marvin/tree/develop for the latest

## Licensing

You can do whatever you want.

## Objectives

The goals of this project are:

+ Give Elixir coders access to the EV3 via [EV3DEV](http://ev3dev.org) -- DONE --
+ Implement a function domain language for interacting with the EV3 brick --DONE --
+ Take full advantage of processes and OTP to implement a "society of mind" model, with perception, motivation, behavior and actuation. --DONE--
+ Implement a robot control panel in Elm and Phoenix. --DONE--
+ Get two robots to interact and even cooperate. --TBD--
+ Having fun! -- so far so good --

This project was inspired by [Torben Hoffmann](http://www.elixirconf.eu/elixirconf2015/torben-hoffmann). Thanks Torben!

## Prerequisites

* You will need a [Lego Mindstorms EV3 kit](http://www.lego.com/en-us/mindstorms/)
* A micro-SD card with [EV3Dev](http://www.ev3dev.org) on it
* Some way to communicate with the EV3 brick (Bluetooth or WiFi - WiFi works on Linux)
* [Erlang](http://www.erlang.org) and [Elixir](http://http://elixir-lang.org/) installed on both you computer and the EV3

Go to my [blog](http://jfcloutier.github.io/robotex/) for further instructions, pointers and examples.

## Development

I use the following shell script to quickly upload and install code on the EV3 brick:

On my computer's .bashrc file:

alias deploy-ev3='pushd ~/projects/ev3; mix compile; node_modules/brunch/bin/brunch build; pushd ~/projects; tar -cf ev3.tar --exclude="*.git" --exclude="*.*~" --exclude=".gitignore" ev3; scp ev3.tar robot@192.168.1.100:~/ev3.tar; popd; popd'

On the EV3 brick, in my .bashrc file:

`alias install-ev3='pushd ~;rm -r ev3;tar -xvf ev3.tar;popd'`

You will need to modify them to fit your own context.



