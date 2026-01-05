param(
    [Parameter(Mandatory = $true)]
    [string]$ProjectName,
    [Parameter(Mandatory = $true)]
    [string]$RootFolder
)

$ProjectCoreName = "$ProjectName.Core"
$ProjectInfraName = "$ProjectName.Infrastructure"
$ProjectTestName = "$ProjectName.Test"

$ProjectPath = Join-Path -Path $RootFolder -ChildPath $ProjectName

# Create project directory
if (!(Test-Path $ProjectPath)) {
    New-Item -Path $ProjectPath -ItemType Directory -Force | Out-Null
    Write-Host "Project folder not found, creating: $ProjectPath" -ForegroundColor Cyan
}

# Change to project directory
Set-Location -Path $ProjectPath

# Execute dotnet commands
Write-Host "Initializing .NET solution and projects..." -ForegroundColor Yellow
dotnet new sln -n $ProjectName
# When no parameters are specified, dotnet new selects the latest stable SDK installed on computer
dotnet new classlib -n $ProjectCoreName -o $ProjectCoreName
dotnet new classlib -n $ProjectInfraName -o $ProjectInfraName
dotnet new xunit -n $ProjectTestName -o $ProjectTestName

# Add projects to solution
$CoreCsproj = Join-Path $ProjectCoreName "$ProjectCoreName.csproj"
$InfraCsproj = Join-Path $ProjectInfraName "$ProjectInfraName.csproj"
$TestCsproj = Join-Path $ProjectTestName "$ProjectTestName.csproj"

dotnet sln add $CoreCsproj
dotnet sln add $InfraCsproj
dotnet sln add $TestCsproj

# 6. Add project references
dotnet add $InfraCsproj reference $CoreCsproj
dotnet add $TestCsproj reference $CoreCsproj
dotnet add $TestCsproj reference $InfraCsproj

Write-Host "Project $ProjectName created successfully." -ForegroundColor Green