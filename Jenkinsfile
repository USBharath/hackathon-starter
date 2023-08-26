pipeline {
    agent any
    stages {
        stage('Git clone') {
            steps {
                git credentialsId: 'github', branch: 'master', url: 'https://github.com/USBharath/hackathon-starter.git'
            }
        }
    }
}
