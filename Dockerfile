# Use .NET 9 ASP.NET Core runtime
FROM mcr.microsoft.com/dotnet/aspnet:9.0

WORKDIR /app

# Copy published folder into container
COPY ./API_publish  .

# Run the app
ENTRYPOINT ["dotnet", "Savio.API.dll"]
