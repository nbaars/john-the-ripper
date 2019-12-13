#!/usr/bin/env bash

curl https://www.openwall.com/passwords/pwdump -o pwdump
curl https://mirrors.edge.kernel.org/openwall/wordlists/passwords/password.gz -o password.gz

gunzip password.gz

john --wordlist=password.lst --rules mypasswd
