$rootPath = Read-Host "Root folder path"

# 檢查路徑是否存在，不存在則建立
if (!(Test-Path $rootPath)) {
    New-Item -ItemType Directory -Force -Path $rootPath
    Write-Host "已建立 Root 資料夾: $rootPath" -ForegroundColor Cyan
}

# 設定專案名稱與根目錄
$projectName = "Example.CSharp"
$baseDir = Join-Path $rootPath $projectName

# 定義各個資料夾路徑
$srcDir = "$baseDir/Src/DotNet/Architecture"
$testDir = "$baseDir/Tests/DotNet/UnitTests"

Write-Host "Creating project folders: $baseDir ..." -ForegroundColor Yellow

# 建立目錄結構
New-Item -ItemType Directory -Force -Path $srcDir
New-Item -ItemType Directory -Force -Path $testDir

# 切換到專案根目錄
Set-Location $baseDir

# 建立 Solution 檔案
dotnet new sln -n $projectName

# 建立 Src 專案 (Class Libraries)
dotnet new classlib -n Example.Core -o "$srcDir/Example.Core"
dotnet new classlib -n Example.Infrastructure -o "$srcDir/Example.Infrastructure"

# 建立 Tests 專案 (xUnit)
dotnet new xunit -n Example.Core.Test -o "$testDir/Example.Core.Test"
dotnet new xunit -n Example.Infrastructure.Test -o "$testDir/Example.Infrastructure.Test"

# 移除所有子資料夾中預設產生的 Class1.cs 和 UnitTest1.cs
Write-Host "Cleaning up default files..." -ForegroundColor Gray
Get-ChildItem -Path $baseDir -Include Class1.cs, UnitTest1.cs -Recurse | Remove-Item -Force

# 設定專案引用關係
Write-Host "Setting up project references..." -ForegroundColor Yellow
$coreProj = Join-Path $srcDir "Example.Core/Example.Core.csproj"
$infraProj = Join-Path $srcDir "Example.Infrastructure/Example.Infrastructure.csproj"
$coreTestProj = Join-Path $testDir "Example.Core.Test/Example.Core.Test.csproj"
$infraTestProj = Join-Path $testDir "Example.Infrastructure.Test/Example.Infrastructure.Test.csproj"

# 讓 Infrastructure 引用 Core
dotnet add $infraProj reference $coreProj

# 讓測試專案引用對應的開發專案
dotnet add $coreTestProj reference $coreProj
dotnet add $infraTestProj reference $infraProj

# 將所有專案加入 Solution (明確指定搜尋路徑)
# 使用 .FullName 確保傳遞給 dotnet 指令的是「絕對路徑」
Get-ChildItem -Path $baseDir -Recurse -Filter *.csproj | ForEach-Object {
    dotnet sln add $_.FullName
}

Write-Host "`nCreate done." -ForegroundColor Green
Write-Host "Project path: $baseDir"
Write-Host "`nPress any key to exit..." -ForegroundColor Cyan
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")