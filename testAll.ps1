dotnet test ./ModernApiAppSolution/ModernApiApp.Tests/ModernApiApp.Tests.csproj 
#coverlet ./ModernApiAppSolution/ModernApiApp.Tests/bin/Debug/netcoreapp2.1/ModernApiApp.Tests.dll --target "dotnet" --targetargs "test --no-build" 
dotnet test ./ModernUIAppSolution/ModernUIApp.Tests/ModernUIApp.Tests.csproj
#coverlet ./ModernUIAppSolution/ModernUIApp.Tests/bin/Debug/netcoreapp2.1/ModernUIApp.Tests.dll --target "dotnet" --targetargs "test --no-build"  
