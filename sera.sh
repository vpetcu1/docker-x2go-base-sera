CONTAINER_NAME=sera
DOCKER_NAME=vpetcu1/x2go-mate-base-sera
RUN_COMMAND="docker run -d --name $CONTAINER_NAME -p 23:22 -p 8080:8080 -v /home/vpetcu1/work/sera/:/home/desktop/sera/ --dns 10.111.254.2 $DOCKER_NAME"
operation=$1
case $operation in 
	start)
		if [ ! "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
		    if [ "$(docker ps -aq -f status=exited -f name=$CONTAINER_NAME)" ]; then
			# cleanup
			docker rm $CONTAINER_NAME
		    fi
		    # run your container
		    $RUN_COMMAND
		fi
		;;
	stop)
		docker stop $CONTAINER_NAME
		;;
	pull)
		docker pull $DOCKER_NAME
		;;
	*)
		echo "Must pass one of the args start|stop|pull"
		;;
esac
