#Depending on the operating system of the host machines(s) that will build or run the containers, the image specified in the FROM statement may need to be changed.
#For more information, please see https://aka.ms/containercompat

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src
COPY ["ModernApiApp/ModernApiApp.csproj", "ModernApiApp/"]
RUN dotnet restore "ModernApiApp/ModernApiApp.csproj"
COPY . .
WORKDIR "/src/ModernApiApp"
RUN dotnet build "ModernApiApp.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "ModernApiApp.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

ENV ApiAppDatabaseServer modernapiapp.database
ENV ApiAppDatabaseName ModernApiDB
ENV ApiAppDatabaseUser sa
ENV ApiAppDatabasePassword Microsoft2018!1
ENV ASPNETCORE_ENVIRONMENT Development
ENTRYPOINT ["dotnet", "ModernApiApp.dll"]
