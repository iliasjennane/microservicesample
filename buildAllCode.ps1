Set-ExecutionPolicy Bypass  -Scope CurrentUser
dotnet build ./simpleweb.Solution/simpleweb/simpleweb.csproj ; dotnet build ./simpleweb.Solution/simpleweb.Tests/simpleweb.Tests.csproj
dotnet test ./simpleweb.Solution/simpleweb.Tests/simpleweb.Tests.csproj 


dotnet build ./simpleapi.Solution/simpleapi/simpleapi.csproj ; dotnet build ./simpleapi.Solution/simpleapi.Entities/simpleapi.Entities.csproj; dotnet build ./simpleapi.Solution/simpleapi.Tests/simpleapi.Tests.csproj
dotnet test ./simpleapi.Solution/simpleapi.Tests/simpleapi.Tests.csproj 