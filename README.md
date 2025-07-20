# JenkinsDemo: MathEngine.Core (.NET TDD Sample)

This project demonstrates a Test-Driven Development (TDD) class library in .NET, ready for Jenkins CI/CD integration.

## 🧪 Features
- Class library: `MathEngine.Core`
- Unit tests: xUnit
- Jenkins Pipeline: restore, build, test
- Compatible with Docker, Git, and Windows-based Jenkins setups

## 📁 Structure
- `src/` - Core logic (e.g. Calculator)
- `tests/` - xUnit tests
- `Jenkinsfile` - Declarative CI pipeline

## 🚀 Quick Commands
```powershell
dotnet restore
dotnet build --configuration Release
dotnet test
```
---

## 🧾 Jenkins Configuration as Code (Optional `jenkins.yaml`)

If you're using the JCasC plugin:

```powershell
@"
jenkins:
  systemMessage: "JenkinsDemo: .NET TDD Setup"
  numExecutors: 2
  scmCheckoutRetryCount: 2
  tools:
    dotnet:
      installations:
        - name: "Default .NET SDK"
          home: "C:\\Program Files\\dotnet"
  credentials:
    system:
      domainCredentials:
        - credentials:
            - basicSSHUserPrivateKey:
                scope: GLOBAL
                id: "jenkins-ssh"
                username: "git"
                privateKeySource:
                  directEntry:
                    privateKey: "-----BEGIN OPENSSH PRIVATE KEY-----\n..."
  jobs:
    - script: >
        pipelineJob('MathEngine-CI') {
          definition {
            cpsScm {
              scm {
                git {
                  remote {
                    url('git@github.com:your-org/JenkinsDemo.git')
                    credentials('jenkins-ssh')
                  }
                  branches('*/main')
                }
              }
              scriptPath('Jenkinsfile')
            }
          }
        }
