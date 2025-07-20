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
        sh 'dotnet test tests/MathEngine.Core.Tests/ --logger "trx"'
      }
    }
  }

  post {
    always {
      sh 'find tests -name "*.trx" -type f'
      junit 'tests/MathEngine.Core.Tests/TestResults/*.trx'
    }
  }
}
