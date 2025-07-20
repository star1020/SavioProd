# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

# Copy only the project files
COPY Savio/Savio.API/Savio.API.csproj ./Savio.API/
# Add additional csproj if needed
# COPY Savio/Savio.Core.Data/Savio.Core.Data.csproj ./Savio.Core.Data/

# Restore dependencies
RUN dotnet restore ./Savio.API/Savio.API.csproj

# Copy the rest of the source
COPY Savio ./Savio

# Build and publish
WORKDIR /app/Savio.API
RUN dotnet publish Savio.API.csproj -c Release -o /app/publish

# Stage 2: Runtime image
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "Savio.API.dll"]
