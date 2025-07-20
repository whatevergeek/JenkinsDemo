FROM jenkins/jenkins:lts

USER root

# Install .NET SDK
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    apt-transport-https \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Install Microsoft package signing key and repository
RUN wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb

# Install .NET SDK
RUN apt-get update && apt-get install -y --no-install-recommends \
    dotnet-sdk-8.0 \
    && rm -rf /var/lib/apt/lists/*

# Install Jenkins plugins
RUN jenkins-plugin-cli --plugins \
    git \
    workflow-aggregator \
    junit \
    dotnet-sdk \
    docker-workflow

# Switch back to jenkins user
USER jenkins

# Verify installations
RUN dotnet --version