# Use ASP.NET Core 9.0 runtime image
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

# Copy published output
COPY . .

# Run the application
ENTRYPOINT ["dotnet", "MoneyRecordWeb.dll"]
