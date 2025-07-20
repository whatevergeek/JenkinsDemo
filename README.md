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