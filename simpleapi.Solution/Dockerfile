FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["simpleapi/simpleapi.csproj", "simpleapi/"]
RUN dotnet restore "simpleapi/simpleapi.csproj"
COPY . .
WORKDIR "/src/simpleapi"
RUN dotnet build "simpleapi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "simpleapi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "simpleapi.dll"]
