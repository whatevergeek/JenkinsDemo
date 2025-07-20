pipeline {
  agent any
  
  tools {
    // Use .NET SDK from Jenkins tool installations
    // Make sure to configure this tool name in Jenkins
    dotnet 'Default .NET SDK'
  }

  stages {
    stage('Restore') {
      steps {
        bat 'dotnet restore'
      }
    }

    stage('Build') {
      steps {
        bat 'dotnet build --configuration Release'
      }
    }

    stage('Test') {
      steps {
        bat 'dotnet test tests/MathEngine.Core.Tests/ --logger "trx" --results-directory "./TestResults"'
      }
    }
  }

  post {
    always {
      junit 'TestResults/**/*.trx'
    }
  }
}
