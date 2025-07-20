# JenkinsDemo: MathEngine.Core (.NET TDD Sample)

This project demonstrates a Test-Driven Development (TDD) class library in .NET, ready for Jenkins CI/CD integration.

## 🧪 Features
- Class library: `MathEngine.Core`
- Unit tests: MSTest
- Jenkins Pipeline: restore, build, test
- Compatible with Docker, Git, and Windows-based Jenkins setups

## 📁 Structure
- `src/` - Core logic (e.g. Calculator)
- `tests/` - Unit tests
- `Jenkinsfile` - Declarative CI pipeline

## 🚀 Quick Commands
```powershell
dotnet restore
dotnet build --configuration Release
dotnet test
```

## 🐳 Jenkins Docker Setup
```bash
# Start Jenkins with Docker Compose
docker-compose up -d

# Get the initial admin password
docker-compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

# Access Jenkins at http://localhost:8081
```

The Docker setup includes:
- Jenkins LTS with .NET SDK 8.0
- Essential Jenkins plugins for .NET projects
- Persistent volume for Jenkins data