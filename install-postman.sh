#!/bin/bash

wget https://dl.pstmn.io/download/latest/linux64 -O postman-linux-x64.tar.gz
tar -xvzf postman-linux-x64.tar.gz -C /opt
ln -s /opt/Postman/Postman /usr/bin/postman