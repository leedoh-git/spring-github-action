#!/bin/bash

ROOT_PATH="/home/ubuntu/cicdtest"
JAR="$ROOT_PATH/application.jar"
LOG_FILE="$ROOT_PATH/log/stop.log"
SERVICE_PID=$(pgrep -f $JAR) # 실행중인 Spring 서버의 PID

if [ -z "$SERVICE_PID" ]; then
  echo "서비스 NouFound" >> LOG_FILE
else
  echo "서비스 종료 " >> LOG_FILE
  kill "$SERVICE_PID"
  # kill -9 $SERVICE_PID # 강제 종료를 하고 싶다면 이 명령어 사용
fi