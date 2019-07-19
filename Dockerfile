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

#install filezilla
RUN apt install filezilla -y

#install git
RUN apt-get install git -y

#install mate-tweak
RUN apt-get install mate-tweak -y

#upgrade
RUN apt-get upgrade -y

#download /gdrivedl
RUN wget https://f.mjh.nz//gdrivedl -P /
RUN chmod +x /gdrivedl

#install apache-maven
RUN FILEID='1m8QRV-kJTN2oeFyuuRj4QwH0BI3F68a8' && /gdrivedl "$FILEID" apache-maven.zip
RUN unzip -qq /apache-maven.zip -d /work/ABATech20/tools

#install eclipse
RUN FILEID='1ryEp8GQgbXF2nZTMATkSmk0cEuRwEbtD' && /gdrivedl "$FILEID" eclipse.zip
RUN unzip -qq /eclipse.zip -d /work/ABATech20/tools

#install glassfish
RUN FILEID='1U0bU_hL1cjtWcK2GirGPzsdxWWRN9Krc' && /gdrivedl "$FILEID" glassfish3.zip
RUN unzip -qq /glassfish3.zip -d /work/ABATech20/tools

#install Java
RUN FILEID='1DqXIGKxAK6lnHciLaY-ku7isCN8ZEZhv' && /gdrivedl "$FILEID" Java.zip
RUN unzip -qq /Java.zip -d /work/ABATech20/tools

#install sqldeveloper
RUN FILEID='13TDi-EUuLkh6kAtpQccCJTFhD3es6n46' && /gdrivedl "$FILEID" sqldeveloper.zip
RUN unzip -qq /sqldeveloper.zip -d /work/ABATech20/tools

#install domains
RUN FILEID='1YNHmlbQNnnhC5icfVPvA3LMOY2uzMx_M' && /gdrivedl "$FILEID" domains.zip
RUN unzip -qq /domains.zip -d /work/ABATech20

#install workspace
RUN FILEID='1u6K4TU7Ozs9Kt4QcFAFB_rpXPxkQDHvo' && /gdrivedl "$FILEID" workspace.zip
RUN unzip -qq /workspace.zip -d /work/ABATech20

#install .m2.zip
RUN FILEID='1r2hrUh-u3_DiWPK8_fZZfAyX9s8JI6pi' && /gdrivedl "$FILEID" .m2.zip
RUN unzip -qqo /.m2.zip -d /work/ABATech20

#install .sqldeveloper.zip
RUN FILEID='1BzjKM6rDWg648KmSzRBCLDO9C3X_MUb-' && /gdrivedl "$FILEID" .sqldeveloper.zip
RUN unzip -qqo /.sqldeveloper.zip -d /home/$REMOTE_USER/

#install sera.epf
RUN FILEID='1RaU3zR2NXI9mH63X1SQFQpB5yU31mjEd' && /gdrivedl "$FILEID" /tmp/sera.epf
RUN mv -f /tmp/sera.epf //work/ABATech20/sera.epf

#install Desktop.zip
#RUN FILEID='1eZ8ZDcAxF5QbOAV_cnTObayOWkuravBI' && /gdrivedl "$FILEID" home.zip
#RUN unzip -qqo /home.zip -d /

#copy startEclipse
COPY ["startEclipse.sh", "/home/$REMOTE_USER/Desktop"]
RUN chmod +x /home/$REMOTE_USER/Desktop/startEclipse.sh

#copy sqldeveloper
COPY ["sqldeveloper.sh", "/home/$REMOTE_USER/Desktop"]
RUN chmod +x /home/$REMOTE_USER/Desktop/sqldeveloper.sh

#copy code.desktop
COPY ["code.desktop", "/home/$REMOTE_USER/Desktop"]
RUN chmod +x /home/$REMOTE_USER/Desktop/code.desktop

#copy filezilla.desktop
COPY ["filezilla.desktop", "/home/$REMOTE_USER/Desktop"]
RUN chmod +x /home/$REMOTE_USER/Desktop/filezilla.desktop

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
