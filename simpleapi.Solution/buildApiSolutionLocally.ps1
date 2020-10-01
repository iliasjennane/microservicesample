Set-ExecutionPolicy Bypass  -Scope CurrentUser
dotnet build ./simpleapi/simpleapi.csproj ; dotnet build ./simpleapi.Entities/simpleapi.Entities.csproj; dotnet build ./simpleapi.Tests/simpleapi.Tests.csproj
dotnet test ./simpleapi.Tests/simpleapi.Tests.csproj 