#!/bin/bash
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

# Install dependancies
dist=`grep DISTRIB_ID /etc/*-release | awk -F '=' '{print $2}'`
if [ "$dist" == "Ubuntu" ]; then
	sudo apt-get install -y build-essential cmake python-dev python3-dev
fi

git submodule update --init --recursive

cd $MY_PATH/bundle/YouCompleteMe
python install.py --all

cd $MY_PATH/bundle/vimproc.vim
make

