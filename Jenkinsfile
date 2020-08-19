pipeline {
    agent {label 'Slave 2'}
    triggers {
        pollSCM('* * * * 1-5')
    }
    stages {
        stage('Cleanup') { // Compile and do unit testing
            steps {
                // run Gradle to execute compile and unit testing
                cleanWs()
            }
        }
        stage('Source') { // Get code
            steps {
                // get code from our Git repository
                git 'https://github.com/hrazaf6/spring-petclinic.git'
            }
        }
        stage('Compile') { // Compile and do unit testing
            steps {
                // run Gradle to execute compile and unit testing
                sh "./mvnw compile"
            }
        }
        stage('Test') { // Compile and do unit testing
            steps {
                // run Gradle to execute compile and unit testing
                sh "./mvnw test"
            }
        }
        stage('Package') { // Compile and do unit testing
            steps {
                // run Gradle to execute compile and unit testing
                sh "./mvnw package"
            }
        }
        stage('Publish') { // Compile and do unit testing
            steps {
                // run Gradle to execute compile and unit testing
                sh "aws s3 cp target/spring-petclinic-2.1.2.BUILD-SNAPSHOT.jar s3://cloudilm-artifacts"
            }
        }
    }
    post {
         failure {
             echo "Build failed"
         }
         success {
             echo "Build Success"
         }
    }
}
