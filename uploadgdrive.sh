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
	glassfish3.zip)
		cd /work/ABATech20/tools
		zip -r $operation glassfish3/
		mv $operation /home/desktop/sera/
		/gdrive update 1U0bU_hL1cjtWcK2GirGPzsdxWWRN9Krc /home/desktop/sera/$operation
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
	bin.zip)
		cd /home/desktop/
		zip -r $operation .sqldeveloper/
		mv $operation /home/desktop/sera/
		/gdrive update 1BzjKM6rDWg648KmSzRBCLDO9C3X_MUb- /home/desktop/sera/$operation
		;;
	sera.epf)
		/gdrive update 1BzjKM6rDWg648KmSzRBCLDO9C3X_MUb- /home/desktop/sera/$operation
		;;
	*)
		echo "Must pass one of the args .sqldeveloper.zip|apache-maven.zip|pull"
		;;
esac
