#!/bin/sh

LOG_FILE="/var/lib/jenkins/jenkins.log"

echo "Script execution started" >> $LOG_FILE

# 현재 실행 중인 애플리케이션 PID 확인 및 종료
CURRENT_PID=$(ps -ef | grep java | grep 'jenkins-practice-0.0.1-SNAPSHOT.jar' | grep -v grep | awk '{print $2}')

if [ -z "$CURRENT_PID" ]; then
    echo "No running application to kill." >> $LOG_FILE
else
    echo "Killing application with PID: $CURRENT_PID" >> $LOG_FILE
    kill -9 $CURRENT_PID
    sleep 10
fi

# 새로운 애플리케이션 배포
echo "Starting new application deployment" >> $LOG_FILE
nohup java -jar /var/lib/jenkins/workspace/jenkins-server/build/libs/jenkins-practice-0.0.1-SNAPSHOT.jar >> $LOG_FILE 2>&1 &
echo "Deployment successful!" >> $LOG_FILE

echo "Script execution finished" >> $LOG_FILE