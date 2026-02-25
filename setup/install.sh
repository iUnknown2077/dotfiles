paru -S --needed $(cat packages.txt | grep -v '^$')
