# Setting Up Jenkins in Docker

## Prerequisites
- Docker installed
- Docker Compose installed

## Setup Steps

### 1. Build and Start Jenkins

```bash
# Navigate to the project directory
cd path/to/JenkinsDemo

# Create the Jenkins data directory if it doesn't exist
mkdir -p D:/laboratory/jenkins_data

# Build and start the Jenkins container
docker-compose up -d
```

### 2. Get the Initial Admin Password

```bash
# Wait for Jenkins to start (may take a minute)
docker-compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

### 3. Complete Jenkins Setup

1. Open your browser and navigate to http://localhost:8081
2. Enter the admin password from step 2
3. Choose "Install suggested plugins" or select specific plugins
4. Create your admin user when prompted
5. Configure Jenkins URL (default is fine)
6. Click "Start using Jenkins"

### 4. Configure .NET Tools in Jenkins

1. Go to "Manage Jenkins" > "Global Tool Configuration"
2. Scroll to ".NET SDK" section (should be available from the pre-installed plugin)
3. Click "Add .NET SDK"
4. Name it "Default .NET SDK"
5. Leave installation directory blank to use the one we installed in the Docker image
6. Save the configuration

### 5. Create a Pipeline Job

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

### 6. Run the Pipeline

1. Click on your new pipeline job
2. Click "Build Now"
3. Watch the pipeline execute the stages defined in your Jenkinsfile

## Troubleshooting

- If Jenkins can't find the .NET SDK, verify it's installed correctly in the container:
  ```bash
  docker-compose exec jenkins dotnet --version
  ```

- If you need to restart Jenkins:
  ```bash
  docker-compose restart
  ```

- To view Jenkins logs:
  ```bash
  docker-compose logs -f jenkins
  ```