pipeline {
    agent any
    options {
        skipDefaultCheckout(true)
        disableConcurrentBuilds()
        timeout(time: 15, unit: 'MINUTES')
    }
    environment {
        STUDENT_NAME = 'Miras'
        STUDENT_SURNAME = 'Tusupkali'
        STUDENT_GROUP = 'IT2-2312'
        STUDENT_ID = '38366'
        DOCKER_IMAGE = 'tusupkali-miras-devops'
        APP_CONTAINER = 'tusupkali-miras-container'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'git log -1 --oneline'
                echo "Student: ${env.STUDENT_NAME} ${env.STUDENT_SURNAME}"
                echo "Group: ${env.STUDENT_GROUP}"
                echo "Student ID: ${env.STUDENT_ID}"
            }
        }
        stage('Build') {
            steps { sh 'python3 -m compileall -q app tests' }
        }
        stage('Test') {
            steps {
                sh '''
                    status=0
                    python3 -m unittest discover -s tests -v > test-results.txt 2>&1 || status=$?
                    cat test-results.txt
                    exit "$status"
                '''
            }
        }
        stage('Docker Build') {
            steps { sh 'docker build -t "$DOCKER_IMAGE:$BUILD_NUMBER" -t "$DOCKER_IMAGE:latest" .' }
        }
        stage('Docker Run') {
            steps {
                sh '''
                    existing=$(docker ps -aq --filter "name=^/${APP_CONTAINER}$")
                    if [ -n "$existing" ]; then
                        owner=$(docker inspect --format '{{ index .Config.Labels "devops.student-id" }}' "$APP_CONTAINER")
                        [ "$owner" = "$STUDENT_ID" ] || { echo 'Container belongs to another project'; exit 1; }
                        docker rm -f "$APP_CONTAINER"
                    fi
                    docker run -d --name "$APP_CONTAINER" \
                        --label "devops.student-id=$STUDENT_ID" \
                        -p 127.0.0.1:8000:8000 \
                        -e STUDENT_NAME -e STUDENT_SURNAME -e STUDENT_GROUP -e STUDENT_ID \
                        "$DOCKER_IMAGE:$BUILD_NUMBER"
                    for attempt in $(seq 1 30); do
                        if docker exec "$APP_CONTAINER" python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:8000/health', timeout=2)"; then
                            docker logs "$APP_CONTAINER"
                            exit 0
                        fi
                        sleep 1
                    done
                    docker logs "$APP_CONTAINER"
                    exit 1
                '''
            }
        }
    }
    post {
        always { archiveArtifacts artifacts: 'test-results.txt', allowEmptyArchive: true }
    }
}
