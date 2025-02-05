operation=$1
case $operation in 
	apache-maven.zip)
		cd /work/ABATech20/tools
		zip -r $operation apache-maven/
		mv $operation /home/desktop/sera/
		/gdrive update 1m8QRV-kJTN2oeFyuuRj4QwH0BI3F68a8 /home/desktop/sera/$operation
		;;
	eclipse.zip)
		cd /work/ABATech20/tools
		zip -r $operation eclipse/
		mv $operation /home/desktop/sera/
		/gdrive update 1ryEp8GQgbXF2nZTMATkSmk0cEuRwEbtD /home/desktop/sera/$operation
		;;
	payara.zip)
		cd /work/ABATech20/tools
		zip -r $operation payara/
		mv $operation /home/desktop/sera/
		/gdrive update 1e-8Vz-zGJxEevrUc9k2pUfKvL5KKKcCy /home/desktop/sera/$operation
		;;
	Java.zip)
		cd /work/ABATech20/tools
		zip -r $operation Java/
		mv $operation /home/desktop/sera/
		/gdrive update 1DqXIGKxAK6lnHciLaY-ku7isCN8ZEZhv /home/desktop/sera/$operation
		;;
	sqldeveloper.zip)
		cd /work/ABATech20/tools
		zip -r $operation sqldeveloper/
		mv $operation /home/desktop/sera/
		/gdrive update 13TDi-EUuLkh6kAtpQccCJTFhD3es6n46 /home/desktop/sera/$operation
		;;
	domains.zip)
		cd /work/ABATech20
		zip -r $operation domains/
		mv $operation /home/desktop/sera/
		/gdrive update 1YNHmlbQNnnhC5icfVPvA3LMOY2uzMx_M /home/desktop/sera/$operation
		;;
	.m2.zip)
		cd /work/ABATech20
		zip -r $operation .m2/
		mv $operation /home/desktop/sera/
		/gdrive update 1r2hrUh-u3_DiWPK8_fZZfAyX9s8JI6pi /home/desktop/sera/$operation
		;;
	bin.zip)
		cd /work/ABATech20
		zip -r $operation bin/
		mv $operation /home/desktop/sera/
		/gdrive update 1I704d6TBNBlk7xDh9p9lN-6sYe-OicMM /home/desktop/sera/$operation
		;;
	.sqldeveloper.zip)
		cd /home/desktop/
		zip -r $operation .sqldeveloper/
		mv $operation /home/desktop/sera/
		/gdrive update 1W02kmD5K3wJCplmdv7g1SnhwJWSf58os /home/desktop/sera/$operation
		;;
	.postman.zip)
		cd /home/desktop/
		zip -r $operation .postman/
		mv $operation /home/desktop/sera/
		/gdrive update 17gN8OM3Iph1k_XB3y3JtPeec3RotpssE /home/desktop/sera/$operation
		;;
	snowflake-ssh.zip)
		cd /home/desktop/
		zip -r $operation snowflake-ssh/
		mv $operation /home/desktop/sera/
		/gdrive update 1c5DUUt5iUdBDffW8og9EZmJAbIsKvRiG /home/desktop/sera/$operation
		;;
	google-chrome.zip)
		cd /home/desktop/.config
		zip -r $operation google-chrome/
		mv $operation /home/desktop/sera/
		/gdrive update 1AiyuA54anhJ0jxSE87qRyY5a04wDcHzS /home/desktop/sera/$operation
		;;
	barracudavpn.zip)
		cd /etc/
		zip -r $operation barracudavpn/
		mv $operation /home/desktop/sera/
		/gdrive update 1XZ0TM226lJFl5gM0VvpM64gA37z2QWCt /home/desktop/sera/$operation
		;;
	sera.epf)
		/gdrive update 1Rxj7YM4L9RIWJ_UxcccS2PjArQsjxgJU /home/desktop/sera/$operation
		;;
	SERA_Clean_Up.xml)
		/gdrive update 129M38eegcT8uRGXzyR0ShGNtnMP30SYW /home/desktop/sera/$operation
		;;
	SERA_Formatter.xml.epf)
		/gdrive update 1_SgOTZJ4Y0RayfIn_gwxGE7PO_lJsat2 /home/desktop/sera/$operation
		;;
	*)
		echo "Must pass one of the args .sqldeveloper.zip|apache-maven.zip|pull"
		;;
esac
