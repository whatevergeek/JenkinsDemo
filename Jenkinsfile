pipeline {
  agent {
    docker {
      image 'mcr.microsoft.com/dotnet/sdk:7.0'
    }
  }

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
        sh 'dotnet test tests/MathEngine.Core.Tests/ --logger "trx" --results-directory "./TestResults"'
      }
    }
  }

  post {
    always {
      junit 'TestResults/**/*.trx'
    }
  }
}
