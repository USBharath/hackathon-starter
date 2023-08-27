pipeline {
    agent { label 'slave' }
    stages {
        stage('Git clone') {
            steps {
                git credentialsId: 'github', branch: 'master', url: 'https://github.com/USBharath/hackathon-starter.git'
            }
        }
        // stage('Deploy') {
        //     steps {
        //         sh '''
        //         npm install express
        //         sudo npm install -g nodemon
        //         nodemon app.js
        //         '''
        //     }
        // }
        stage('build') {
            steps {
                sh 'docker build -t hackton:latest .'
            }
        }
        stage('Trivy scan') {
            steps {
                sh 'trivy hackton:latest'
            }
        }
    }
}
