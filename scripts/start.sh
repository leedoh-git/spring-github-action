ROOT_PATH="/home/ubuntu/cicdtest"
JAR="$ROOT_PATH/application.jar"

APP_LOG="$ROOT_PATH/log/application.log"
ERROR_LOG="$ROOT_PATH/log/error.log"
LOG_FILE="$ROOT_PATH/log/start.log"

NOW=$(date +%c)

echo "[$NOW] $JAR 복사" >> $LOG_FILE
cp $ROOT_PATH/build/libs/*.jar $JAR

echo "[$NOW] > $JAR 실행" >> $LOG_FILE
nohup java -jar $JAR > $APP_LOG 2> $ERROR_LOG &

SERVICE_PID=$(pgrep -f $JAR)
echo "[$NOW] > 서비스 PID: $SERVICE_PID" >> $LOG_FILE