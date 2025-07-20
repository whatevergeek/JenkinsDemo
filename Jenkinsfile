pipeline {
  agent any

  stages {
    stage('Restore') {
      steps {
        sh 'dotnet restore'
      }
    }

    stage('Build') {
      steps {
        sh 'dotnet build --configuration Release'
      }
    }

    stage('Test') {
      steps {
        sh 'dotnet test tests/MathEngine.Core.Tests/ --logger "junit;LogFilePath=./TestResults/results.xml"'
      }
    }
  }

  post {
    always {
      sh 'find . -name "*.xml" -type f'
      junit 'TestResults/*.xml'
    }
  }
}
