SCRIPT_DIR=$(dirname $0)

cd $SCRIPT_DIR
docker build -t cloud_project:base base/
docker build -t cloud_project:dev dev/