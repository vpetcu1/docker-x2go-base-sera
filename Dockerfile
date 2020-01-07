FROM vpetcu1/x2go-mate-base
MAINTAINER Vasilica Petcu <vpetcu1@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

USER root

#install ABATech20
RUN mkdir -p /work/ABATech20/tools

#install openjdk-8-jdk
RUN apt-get update && apt-get install openjdk-8-jdk -y

#iinstall vscode
RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
RUN apt-get update && apt-get install code -y

#install electerm
RUN apt-get install gconf2 libappindicator1 -y
RUN wget https://github.com/electerm/electerm/releases/download/v0.27.100/electerm-0.27.100-linux-amd64.deb -P /
RUN dpkg -i electerm-0.27.100-linux-amd64.deb
RUN chmod 4755 /opt/electerm/chrome-sandbox

#install git
RUN apt-get install git -y

#install mate-tweak
RUN apt-get install mate-tweak -y

#install dos2unix
RUN apt-get install dos2unix -y

#install sshpass
RUN apt-get install sshpass -y

#install libgomp1
RUN apt-get install libgomp1 -y

#upgrade
RUN apt-get upgrade -y

#download /gdrivedl
RUN wget https://f.mjh.nz//gdrivedl -P /
RUN chmod +x /gdrivedl

#install apache-maven
RUN FILEID='1m8QRV-kJTN2oeFyuuRj4QwH0BI3F68a8' && /gdrivedl "$FILEID" apache-maven.zip
RUN cd /work/ABATech20/tools && jar -xvf /apache-maven.zip

#install eclipse
RUN FILEID='1ryEp8GQgbXF2nZTMATkSmk0cEuRwEbtD' && /gdrivedl "$FILEID" eclipse.zip
RUN cd /work/ABATech20/tools && jar -xvf /eclipse.zip

#install glassfish
RUN FILEID='1U0bU_hL1cjtWcK2GirGPzsdxWWRN9Krc' && /gdrivedl "$FILEID" glassfish3.zip
RUN cd /work/ABATech20/tools && jar -xvf /glassfish3.zip

#install Java
RUN FILEID='1DqXIGKxAK6lnHciLaY-ku7isCN8ZEZhv' && /gdrivedl "$FILEID" Java.zip
RUN cd /work/ABATech20/tools && jar -xvf /Java.zip

#install sqldeveloper
RUN FILEID='13TDi-EUuLkh6kAtpQccCJTFhD3es6n46' && /gdrivedl "$FILEID" sqldeveloper.zip
RUN cd /work/ABATech20/tools && jar -xvf /sqldeveloper.zip

#install domains
RUN FILEID='1YNHmlbQNnnhC5icfVPvA3LMOY2uzMx_M' && /gdrivedl "$FILEID" domains.zip
RUN cd /work/ABATech20 && jar -xvf /domains.zip

#install workspace
RUN FILEID='1u6K4TU7Ozs9Kt4QcFAFB_rpXPxkQDHvo' && /gdrivedl "$FILEID" workspace.zip
RUN cd /work/ABATech20 && jar -xvf /workspace.zip

#install .m2.zip
RUN FILEID='1r2hrUh-u3_DiWPK8_fZZfAyX9s8JI6pi' && /gdrivedl "$FILEID" .m2.zip
RUN cd /work/ABATech20 && jar -xvf /.m2.zip

#install bin.zip
RUN FILEID='1I704d6TBNBlk7xDh9p9lN-6sYe-OicMM' && /gdrivedl "$FILEID" bin.zip
RUN cd /work/ABATech20 && jar -xvf /bin.zip

#install .sqldeveloper.zip
RUN FILEID='1W02kmD5K3wJCplmdv7g1SnhwJWSf58os' && /gdrivedl "$FILEID" .sqldeveloper.zip
RUN cd /home/$REMOTE_USER/ && jar -xvf /.sqldeveloper.zip

#install electerm.zip
RUN FILEID='1yhyvlJ9h8QENLv8FwAup4i3GyGqctIC4' && /gdrivedl "$FILEID" electerm.zip
RUN cd /home/$REMOTE_USER/.config && jar -xvf /electerm.zip

#install sera.epf
RUN FILEID='1RaU3zR2NXI9mH63X1SQFQpB5yU31mjEd' && /gdrivedl "$FILEID" /tmp/sera.epf
RUN mv -f /tmp/sera.epf /work/ABATech20/sera.epf

#copy startEclipse
COPY ["startEclipse.sh", "/home/$REMOTE_USER/Desktop"]
RUN chmod +x /home/$REMOTE_USER/Desktop/startEclipse.sh

#copy sqldeveloper.sh
COPY ["sqldeveloper.sh", "/home/$REMOTE_USER/Desktop"]
RUN chmod +x /home/$REMOTE_USER/Desktop/sqldeveloper.sh

#copy code.desktop
COPY ["code.desktop", "/home/$REMOTE_USER/Desktop"]
RUN chmod +x /home/$REMOTE_USER/Desktop/code.desktop

#copy electerm.desktop
COPY ["electerm.desktop", "/home/$REMOTE_USER/Desktop"]
RUN chmod +x /home/$REMOTE_USER/Desktop/electerm.desktop

#copy .profile
COPY [".profile", "/home/$REMOTE_USER"]

#copy known_hosts
RUN mkdir -p /home/$REMOTE_USER/.ssh
COPY ["known_hosts", "/home/$REMOTE_USER/.ssh"]

#permissions 
RUN chmod 777 -R /work

#clean up
RUN rm -rf /tmp/*
RUN rm -rf /*.zip

RUN apt-get -y autoclean && apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

RUN chown $REMOTE_USER:$REMOTE_USER -R /home/$REMOTE_USER/

COPY ["*.sh", "/"]
RUN chmod +x /*.sh

COPY ["gdrive", "/"]
RUN chmod +x /gdrive

RUN sh /x2go-mate-base-sera-entrypoint.sh
EXPOSE 22
ENTRYPOINT ["/start-supervisor.sh"]
