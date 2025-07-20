# GitHub Actions CI Setup

This project includes a GitHub Actions workflow for continuous integration. The workflow automatically builds and tests the project when changes are pushed to the main branch or when pull requests are created.

## Workflow Details

The workflow is defined in `.github/workflows/dotnet.yml` and includes the following steps:

1. **Checkout code**: Retrieves the latest code from the repository
2. **Setup .NET**: Installs the .NET SDK version 8.0
3. **Restore dependencies**: Runs `dotnet restore` to install project dependencies
4. **Build**: Compiles the project in Release configuration
5. **Test**: Runs the test suite and generates test reports
6. **Test Report**: Publishes test results to the GitHub Actions interface

## Using GitHub Actions

To use GitHub Actions with this project:

1. Push the code to a GitHub repository
2. Navigate to the "Actions" tab in your GitHub repository
3. The workflow will run automatically on push to main or on pull requests
4. View build and test results directly in the GitHub interface

## Advantages over Jenkins

- **No infrastructure needed**: GitHub Actions runs in the cloud
- **Simple setup**: No need to install or configure a CI server
- **Built-in integration**: Seamlessly works with GitHub repositories
- **Free for public repositories**: 2,000 minutes/month of free build time
- **Parallel jobs**: Run multiple jobs simultaneously

## Customizing the Workflow

To customize the GitHub Actions workflow:

1. Edit the `.github/workflows/dotnet.yml` file
2. Commit and push your changes
3. The updated workflow will be used for subsequent builds