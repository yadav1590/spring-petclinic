pipeline {
agent {label 'Worker_1'}

stages {
  stage('CHECKOUT') {
    steps {
    checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [],
    submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/hrazaf6/spring-petclinic.git']]])
    }
  }

  stage('Clean') {
    steps {
    sh 'ls'
    sh 'pwd'
    sh 'chmod 777 mvnw'
    sh './mvnw clean'
  }
}

stage('Test') {
    steps {
    sh 'ls'
    sh 'pwd'
    sh 'chmod 777 mvnw'
    sh './mvnw test'
  }
}

  stage('BUILD') {
    steps {
    sh 'ls'
    sh 'pwd'
    sh 'chmod 777 mvnw'
    sh './mvnw package'
  }
}

}//Eng of stages
} //End of Pipeline
