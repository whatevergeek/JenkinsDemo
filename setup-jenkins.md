# Setting Up Jenkins for .NET Projects

## 1. Start Jenkins Container

```powershell
# Start Jenkins with a clean LTS image
docker run -d --name jenkins `
  -p 8081:8080 -p 50001:50000 `
  -v "D:\laboratory\jenkins_data:/var/jenkins_home" `
  jenkins/jenkins:lts
```

## 2. Initial Jenkins Setup

1. Get the initial admin password:
   ```powershell
   docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
   ```

2. Open your browser and navigate to http://localhost:8081
3. Enter the admin password
4. Choose "Install suggested plugins" or select specific plugins
5. Create your admin user when prompted
6. Click "Start using Jenkins"

## 3. Install Required Jenkins Plugins

1. Go to "Manage Jenkins" > "Manage Plugins" > "Available"
2. Search for and install these plugins:
   - .NET SDK Support
   - MSTest Plugin
   - JUnit Plugin
   - Docker Pipeline

3. Restart Jenkins when prompted

## 4. Install ICU Libraries in Jenkins Container

```powershell
# Connect to the Jenkins container as root user
docker exec -it -u root jenkins bash

# Install ICU libraries required by .NET
apt-get update
apt-get install -y libicu-dev

# Exit the container
exit
```

## 5. Install .NET SDK via Jenkins Portal

1. Go to "Manage Jenkins" > "Global Tool Configuration"
2. Scroll down to find the ".NET SDK" section
3. Click "Add .NET SDK"
4. Fill in the following:
   - Name: `Default .NET SDK`
   - Install automatically: Check this box
   - Version: Select the version you need (e.g., `.NET 8.0.100`)
5. Save the configuration

## 6. Update Your Jenkinsfile

Ensure your Jenkinsfile includes the tools section to use the configured .NET SDK:

```groovy
pipeline {
  agent any
  
  tools {
    dotnetsdk 'Default .NET SDK'
  }

  stages {
    // Your build stages here
  }
}
```

## 7. Create a Pipeline Job

1. Click "New Item" on the Jenkins dashboard
2. Enter a name (e.g., "MathEngine-CI")
3. Select "Pipeline" and click "OK"
4. In the configuration page, scroll to the "Pipeline" section
5. Select "Pipeline script from SCM"
6. Select "Git" as the SCM
7. Enter your repository URL
8. Specify the branch (e.g., "*/main")
9. Set "Script Path" to "Jenkinsfile"
10. Click "Save"

## 8. Run the Pipeline

1. Click on your new pipeline job
2. Click "Build Now"
3. Watch the pipeline execute the stages defined in your Jenkinsfile