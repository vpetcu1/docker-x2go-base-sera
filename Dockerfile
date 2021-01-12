FROM vpetcu1/x2go-mate-full-20.04
MAINTAINER Vasilica Petcu <vpetcu1@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

USER root

#install ABATech20
RUN mkdir -p /work/ABATech20/tools

#install openjdk-8-jdk
RUN apt-get update && apt-get install openjdk-8-jdk -y

#install openjdk-11-jdk
RUN apt-get update && apt-get install openjdk-11-jdk -y

#install vscode
RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
RUN apt-get update && apt-get install code -y

#install vscode extensions
USER $REMOTE_USER
RUN code --install-extension jmMeessen.jenkins-declarative-support
RUN code --install-extension ms-vscode-remote.remote-ssh
RUN code --install-extension ms-vscode-remote.remote-ssh-edit

USER root

#install teams
RUN wget https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.30857_amd64.deb -P /
RUN dpkg -i teams_1.3.00.30857_amd64.deb

#install google-chrome
COPY ./install-chrome.sh /
RUN chmod +x /install-chrome.sh 
RUN /install-chrome.sh

#install postman
COPY ./install-postman.sh /
RUN chmod +x /install-postman.sh 
RUN /install-postman.sh

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

#install payara
RUN FILEID='1e-8Vz-zGJxEevrUc9k2pUfKvL5KKKcCy' && /gdrivedl "$FILEID" payara.zip
RUN cd /work/ABATech20/tools && jar -xvf /payara.zip

#install sqldeveloper
RUN FILEID='13TDi-EUuLkh6kAtpQccCJTFhD3es6n46' && /gdrivedl "$FILEID" sqldeveloper.zip
RUN cd /work/ABATech20/tools && jar -xvf /sqldeveloper.zip

#install Java
RUN FILEID='1DqXIGKxAK6lnHciLaY-ku7isCN8ZEZhv' && /gdrivedl "$FILEID" Java.zip
RUN cd /work/ABATech20/tools && jar -xvf /Java.zip

#install domains
RUN FILEID='1YNHmlbQNnnhC5icfVPvA3LMOY2uzMx_M' && /gdrivedl "$FILEID" domains.zip
RUN cd /work/ABATech20 && jar -xvf /domains.zip

#install workspace
RUN FILEID='1u6K4TU7Ozs9Kt4QcFAFB_rpXPxkQDHvo' && /gdrivedl "$FILEID" workspace.zip
RUN cd /work/ABATech20 && jar -xvf /workspace.zip

#install .m2.zip
#RUN FILEID='1r2hrUh-u3_DiWPK8_fZZfAyX9s8JI6pi' && /gdrivedl "$FILEID" .m2.zip
#RUN cd /work/ABATech20 && jar -xvf /.m2.zip

#install .sqldeveloper.zip
RUN FILEID='1W02kmD5K3wJCplmdv7g1SnhwJWSf58os' && /gdrivedl "$FILEID" .sqldeveloper.zip
RUN cd /home/$REMOTE_USER/ && jar -xvf /.sqldeveloper.zip

#install .postman.zip
RUN FILEID='17gN8OM3Iph1k_XB3y3JtPeec3RotpssE' && /gdrivedl "$FILEID" .postman.zip
RUN cd /home/$REMOTE_USER/ && jar -xvf /.postman.zip

#install google-chrome.zip
RUN FILEID='1AiyuA54anhJ0jxSE87qRyY5a04wDcHzS' && /gdrivedl "$FILEID" google-chrome.zip
RUN cd /home/$REMOTE_USER/.config && jar -xvf /google-chrome.zip

#install snowflake-ssh.zip
RUN FILEID='1c5DUUt5iUdBDffW8og9EZmJAbIsKvRiG' && /gdrivedl "$FILEID" snowflake-ssh.zip
RUN cd /home/$REMOTE_USER/.config && jar -xvf /snowflake-ssh.zip

#install bin.zip
RUN FILEID='1I704d6TBNBlk7xDh9p9lN-6sYe-OicMM' && /gdrivedl "$FILEID" bin.zip
RUN cd /work/ABATech20 && jar -xvf /bin.zip

#install sera.epf
RUN FILEID='1Rxj7YM4L9RIWJ_UxcccS2PjArQsjxgJU' && /gdrivedl "$FILEID" /tmp/sera.epf
RUN mv -f /tmp/sera.epf /work/ABATech20/sera.epf

#install SERA_Formatter.xml
RUN FILEID='1_SgOTZJ4Y0RayfIn_gwxGE7PO_lJsat2' && /gdrivedl "$FILEID" /tmp/SERA_Formatter.xml
RUN mv -f /tmp/SERA_Formatter.xml /work/ABATech20/SERA_Formatter.xml

#install SERA_Clean_Up.xml
RUN FILEID='129M38eegcT8uRGXzyR0ShGNtnMP30SYW' && /gdrivedl "$FILEID" /tmp/SERA_Clean_Up.xml
RUN mv -f /tmp/SERA_Clean_Up.xml /work/ABATech20/SERA_Clean_Up.xml

#copy startEclipse
COPY ["startEclipse.sh", "/home/$REMOTE_USER/Desktop"]
RUN chmod +x /home/$REMOTE_USER/Desktop/startEclipse.sh

#copy sqldeveloper.sh
COPY ["sqldeveloper.sh", "/home/$REMOTE_USER/Desktop"]
RUN chmod +x /home/$REMOTE_USER/Desktop/sqldeveloper.sh

#copy code.desktop
COPY ["code.desktop", "/home/$REMOTE_USER/Desktop"]
RUN chmod +x /home/$REMOTE_USER/Desktop/code.desktop

#copy google-chrome.desktop
COPY ["google-chrome.desktop", "/home/$REMOTE_USER/Desktop"]
RUN chmod +x /home/$REMOTE_USER/Desktop/google-chrome.desktop

#copy firefox.desktop
COPY ["firefox.desktop", "/home/$REMOTE_USER/Desktop"]
RUN chmod +x /home/$REMOTE_USER/Desktop/firefox.desktop

#copy postman.desktop
COPY ["postman.desktop", "/home/$REMOTE_USER/Desktop"]
RUN chmod +x /home/$REMOTE_USER/Desktop/postman.desktop

#copy .profile
COPY [".profile", "/home/$REMOTE_USER"]

#copy known_hosts
RUN mkdir -p /home/$REMOTE_USER/.ssh
COPY ["known_hosts", "/home/$REMOTE_USER/.ssh"]

COPY ["cloud.pem", "/home/$REMOTE_USER/"]

#install barracuda
COPY ["barracudavpn_5.0.2.7_amd64.deb", "/home/$REMOTE_USER/"]
RUN dpkg -i /home/$REMOTE_USER/barracudavpn_5.0.2.7_amd64.deb

#install snowflake
COPY ["snowflake-1.0.4-setup-amd64.deb", "/home/$REMOTE_USER/"]
RUN dpkg -i /home/$REMOTE_USER/snowflake-1.0.4-setup-amd64.deb

#install SERA_Clean_Up.xml
RUN FILEID='1XZ0TM226lJFl5gM0VvpM64gA37z2QWCt' && /gdrivedl "$FILEID" barracudavpn.zip
RUN cd /etc/ && jar -xvf /barracudavpn.zip


#permissions 
RUN chmod 777 -R /work
RUN chmod 400 /home/$REMOTE_USER/cloud.pem


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
