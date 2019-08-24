# otpshell
One-Time Password generator for CLI using bash, oathtool, and optionally, openssl to encrypt the generation keys... and copys the token into your computer's copy buffer

This script supports both encrypted and plain-text token files. It can be used to encrypt or decrypt a generation key at your convenience.

### Requirements
* oathtool
* xclip *(Optional, use for copy token in desktop enviroment)*
* OpenSSL *(Optional, use if secret is encrypted)*
* Make *(Optional, deploy script)*

### Install
Run make install to automatically install it in  */usr/local/bin* directory or simply copy the *otpshell* file to any directory in path and give it appropriate execution permissions.

### Description
bash shell script to generate OTP *value* from secret token using TOTP.

### Usage
First ensure that there is a directory *~/.secret* in the home dir.

* Create secret token file and encrypt it. Resulting file, *.secret/name.enc*, is an encrypted file containing the secret token.
    * Put your token in a plaintext file in the *~/.secret* directory:
        ```bash
        $ echo "1234567890ABCDEF" > ~/.secret/name
        ```

    * Encrypt the file with the included shell script:
        ```bash
        $ ./otp.sh -e ~/.secret/name
        Password to encrypt file: (enter a password) 
        Enter the password again: (enter a password)
        ```

    * Confirm it worked with:
        ```bash
        $ ls ~/.secret/
        name.enc
        ```

* Run otp.sh without params show the incorporated help :)
* Run otp.sh with name of token (filename without .enc suffix) Will show the following output:
    ```
    $ ./otp.sh <name>
    Perms on [/home/<user>/.secret] are good.
    Password: 
    <name> : 23 : 163261
    ```  

The scrip check the permissions on *~/.secret*, if file is encrypted, required the password. 
Show the name of token and second counter; a new token is generated every 30 seconds. 
The number on the right is the 6-digit One-Time Password.
This will be copied directly into the paste buffer. Just press "CTRL-V" to paste into a login dialog.


## Contents

* Script to do the actual value generation
* Makefile for base instalation (optional)
