pipeline {
  environment {
    registry = "projectnodejs"
    registryUrl = 'projectnodejs.azurecr.io'
    registryCredential = 'acr_registry'
    dockerImage = ''
    BRANCH = 'master'
  }
  agent any
//   agent { label 'slave' }
  
  stages {
    stage('Cloning Git') {
      steps {
        git credentialsId: 'github', branch: 'master', url: 'https://github.com/USBharath/hackathon-starter.git'
      }
    }
    stage('Building Docker Image') {
               steps {
                   script {
                       dockerImage = docker.build registry + ":${BRANCH}-$BUILD_NUMBER"
                   }
               }
        }
        stage('Deploy to ECR') {
            steps {
                script{
                    docker.withRegistry( "http://${registryUrl}", registryCredential ) {
                    dockerImage.push()
                    }
                }
            }
        }
        stage('Cleaning Up') {
               steps{
                 sh "docker rmi --force $registry:${BRANCH}-$BUILD_NUMBER"
               }
        }
        stage ('K8S Deploy') {
            steps {
                script {
                    withKubeConfig([credentialsId: 'aks_config', serverUrl: '']) {
                    // sh '''
                    // kubectl create secret docker-registry acrcred \
                    //     --namespace default \
                    //     --docker-server=projectnodejs.azurecr.io \
                    //     --docker-username=projectnodejs \
                    //     --docker-password=pg/+cFDbqD/mNI+nfNS4kA+5fO1eTq+Hb8gKxawVtI+ACRC/ro8t
                    // '''
                    sh ('kubectl apply -f  deployment.yaml')
                    sh ('kubectl apply -f  ingress.yaml')
                    }
                }
            }
        }
    }
}
