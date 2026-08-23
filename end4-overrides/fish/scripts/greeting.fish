#!/bin/fish

set hour (date +%H)

if test $hour -ge 0 -a $hour -lt 5
    set time night
else if test $hour -lt 12
    set greeting morning
else if test $hour -lt 17
    set greeting afternoon
else if test $hour -lt 22
    set greeting evening
else
    set greeting night
end

cowsay -f stegosaurus "Good $greeting, $USER." | lolcat
