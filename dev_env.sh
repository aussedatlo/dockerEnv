D_NAME="dev_env"
D_IMAGE_NAME="dev/env"
D_IMAGE_TAG="3\.0"
D_PATH=/media/aussedat/MyFiles/Documents/docker/ubuntu

D_IMAGE_IS_BUILT=$(docker images | grep $D_IMAGE_NAME | grep $D_IMAGE_TAG)

if [ ! -z "$D_IMAGE_IS_BUILT" -a "$D_IMAGE_IS_BUILT"!=" " ]; then
	echo "using docker image "$D_IMAGE_NAME
else 
	echo "building docker image" $D_IMAGE_NAME
	docker build 

temp() {
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

case "$1" in
  start)
    echo "Starting Docker $NAME..."
    sudo -u foo-user bash -c 'cd /path/to/scripts/ && ./start-foo.sh'
    ;;
  stop)
    echo "Stopping Foo..."
    sudo -u foo-user bash -c 'cd /path/to/scripts/ && ./stop-foo.sh'
    sleep 2
    ;;
  *)
    echo "Usage: /etc/init.d/foo {start|stop}"
    exit 1
    ;;
esac

exit 0
}
