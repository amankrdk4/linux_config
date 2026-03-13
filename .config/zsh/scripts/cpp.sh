#!/bin/sh
launch(){
    cd $HOME
    git clone https://github.com/amankrdk4/boilerplate
    mkdir code
    cd code
    touch alpha.cpp inp.txt out.txt err.txt 
    nvim alpha.cpp inp.txt out.txt err.txt 
}
nlaunch(){
    cd $HOME
    git clone https://github.com/amankrdk4/boilerplate
    mkdir code
    cd code
    rm alpha.cpp inp.txt
    cp ~/boilerplate/alpha.cpp alpha.cpp
    touch alpha.cpp inp.txt out.txt err.txt 
    nvim alpha.cpp inp.txt out.txt err.txt 
}
