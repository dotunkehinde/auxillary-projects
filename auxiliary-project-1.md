# Shell Scripting
## Introduction
In this project, we will onboard 20 new Linux users onto a server. Our task is to create a shell script that reads a .csv file that contains the first names of the users to be onboarded.
- Created a project folder called Shell
```
mkdir Shell
```
- Moved into the Shell folder
```
cd Shell
```
- Created a `csv` file named `names.csv`  
```
touch  names.csv
```
- Opened the names.csv file
```
vim names.csv
```
- Inserted soem random names into the file
```
dotun
kehinde
bezos
gates
musk
jeff
obama
wale
yusuf
sunday
smith
olamide
adeleke
halimat
solomon
dare
jimoh
joseph
uche
olu
micheal
```
- Created a group called `developers`
```
groupadd developers
```
### Updating my public and private keys
- Changed to directory `.ssh` folder
```
cd .ssh
```
- Created a file for the public key named `id_rsa.pub`
```
vi id_rsa.pub
```
- Copied the public key below into it
```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCzKZyicHxIkklSrNlxsJyyTrcIdBIt84Z0cQb3R4k0jH53kxkaT5hP8tfWTe62LXi7vV86fY+SX7TBNM76XGCbw/6vrMGegm6J1x2i1AiLNwq5nqTjOGn0AIwku4IlCCLAB7tdfRyVuCarmBlwny3lzRyybIUAWXR/D6vpN09MsDILbKdhay+Q/p9OUBMSLPqXdY/QIh/Oe3rVv1lwY3AohNfq7V3tO88zKswfA5iiexNiSYX1myT0OrX8cBE771j9quoNZhQgaLI1mIMtAvnHQChrn9k2nUaO/BMBCQGol5XzGv1ado7hgoVPoluIUD+FGNo/pH4zcmDLICH6drXY/C9MESnkMUPLFxBXKO/OitApY71vRao9nAhAwpVMsy6FqiOb5uawhvhoHYIHTV/f4EtagVagRMP2PxYMYR6jykIV4MPJTkCm+lGhTyMlRu+qRQjdLn8AAtHf4aEV8dIkoGh088DI7eA/4o0wz4OV4upH5ewSFS+5IHmRECEW5Nc=
```
- Created a file for the private key named `id_rsa`
```
vi id_rsa
```
- Copied the private key given into it.

### Onboarding Users Script
```
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
```


