pipeline {
  agent any

  tools {
    dotnetsdk 'Default .NET SDK'
  }
  
  stages {
    stage('Restore') {
      steps {
        sh 'dotnet restore'
        sh 'dotnet add tests/MathEngine.Core.Tests/MathEngine.Core.Tests.csproj package JunitXml.TestLogger'
      }
    }

    stage('Build') {
      steps {
        sh 'dotnet build --configuration Release'
      }
    }

    stage('Test') {
      steps {
        sh 'dotnet test tests/MathEngine.Core.Tests/ --logger:"junit" --results-directory:"./TestResults"'
      }
    }
  }

  post {
    always {
      sh 'find . -name "*.xml" -type f'
      junit testResults: 'TestResults/*.xml', allowEmptyResults: true
    }
  }
}
