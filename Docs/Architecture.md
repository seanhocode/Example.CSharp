Example.CSharp/
│
├── .gitignore
├── README.md
│
├── Docs/                       # [文件區]
│   ├── SyntaxNotes/            # C# 語法筆記
│   ├── Architecture/           # 架構設計心得 (Clean Arch, DDD)
│   ├── DevOps/                 # CI/CD, Docker 設定筆記
│   └── ...                     # 隨需求新增
│
├── Src/                # [程式碼區]
│   ├── DotNet              # .NET 版本範例
│   │   ├── Console/
│   │   ├── Architecture/       # [架構層] 跨專案共用的 Core/Infra 及架構相關範例
│   │   │   ├── Example.Tool/       # 共用工具類別 (Extensions, Helpers)
│   │   │   ├── Example.Core/       # 介面、DTOs、Exceptions
│   │   │   ├── Example.Infra/      # 實作層
│   │   │   └── ...                 # 隨需求新增
│   │   ├── Web/                # [Web 應用區] 
│   │   │   ├── Apis/               # API 專案
│   │   │   │   ├── Example.Api/        # API 範例
│   │   │   │   └── ...                 # 隨需求新增 API 範例
│   │   │   ├── WebApps/            # Web 專案
│   │   │   │   ├── Example.Mvc/        # ASP.NET MVC 範例
│   │   │   │   ├── Example.Blazor/     # Blazor 範例
│   │   │   │   └── ...                 # 隨需求新增 Web 相關範例
│   │   │   ├── RealTime/           # 即時通訊相關專案
│   │   │   │   ├── Example.SignalR/    # SignalR 範例
│   │   │   │   └── ...                 # 隨需求新增即時通訊相關範例
│   │   │   └── ...                 # 隨需求新增 Web 相關專案及其範例
│   │   ├── Desktop/            # [桌面應用區]
│   │   │   ├── WPF/                # WPF 專案
│   │   │   │   ├── Example.WPF/        # WPF 範例
│   │   │   │   └── ...                 # 隨需求新增 WPF 範例
│   │   │   ├── WinForms/           # WinForms 專案
│   │   │   │   ├── Example.WinForms/   # WinForms 範例
│   │   │   │   └── ...                 # 隨需求新增 WinForms 範例
│   │   │   ├── Maui/               # Maui 專案
│   │   │   └── ...                 # 隨需求新增 Desktop 相關專案及其範例
│   │   └── ...                 # 隨需求新增其他 DotNet 相關專案及其範例
│   ├── DotNetFramework/    # 舊版本 .NET Framework 範例
│   └── ...                 # 隨需求新增其他版本相關專案及其範例
├── Tests/              # [測試區] 對應 src 的測試
│   ├── DotNet              # .NET 版本範例
│   │   ├── UnitTests/          # 單元測試範例
│   │   │   ├── Example.Tool.Test/  # Tool 專案測試範例
│   │   │   ├── Example.Core.Test/  # Core 專案測試範例
│   │   │   ├── Example.Infra.Test/ # Infra 專案測試範例
│   │   │   └── ...                 # 隨需求新增
│   │   ├── IntegrationTests/   # 整合測試範例
│   │   │   ├── Example.Api.Test/   # 隨需求新增
│   │   │   └── ...                 # 隨需求新增整合測試專案及其範例
│   │   └── ...                 # 隨需求新增 .NET 相關測試專案及其範例
│   ├── DotNetFramework/    # 舊版本 .NET Framework 測試專案及其範例
│   └── ...                 # 需求新增其他版本相關測試專案及其範例
├── Scripts/            # [腳本區] 放terminal相關腳本
└── ...                 # 隨需求新增