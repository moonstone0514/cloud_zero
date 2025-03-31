SCRIPT_DIR=$(dirname $0)

cd $SCRIPT_DIR
docker build -t icsr_open5gs:base ubuntu/base/
docker build -t icsr_open5gs:dev ubuntu/dev/