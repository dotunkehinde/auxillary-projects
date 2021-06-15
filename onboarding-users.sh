#! /usr/bin/bash
    for i in `more names.csv `                  # Loops through names listed in names.csv
    do
        egrep "^$i" /etc/passwd >/dev/null      # Checks to see if username already existed
        if [ $? -eq 0 ]; then
                echo "$i already exists!"
        else
        echo Adding user $i
        pass=$(perl -e 'print crypt($ARGV[0], "password")' $i)
        useradd -m -p "$pass" "$i"              # Adds a new user with a password same as the username
        echo Added user $i
        usermod -a -G developers "$i"           # Adds the new user to the developers group
        mkdir /home/$i/.ssh                     # Creates the .ssh directory for the new user
        cp /home/ubuntu/.ssh/id_rsa.pub /home/$i/.ssh/authorized_keys           #Copies the public key to the authorized_keys for the ne>

        fi
    done
