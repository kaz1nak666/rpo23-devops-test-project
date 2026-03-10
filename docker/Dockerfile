FROM mcr.microsoft.com/dotnet/sdk:10.0 AS builder
WORKDIR /src
COPY . .
RUN dotnet publish src/TodoApp.Web/TodoApp.Web.csproj -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:10.0
WORKDIR /app
EXPOSE 8080

COPY --from=builder /app/publish .
COPY scripts/apply-migrations.sh .
COPY scripts/EfCoreMigrationsBundle .

# Fix potential Windows line endings and make executable
RUN apt-get update && apt-get install -y dos2unix && \
    dos2unix apply-migrations.sh && \
    chmod +x apply-migrations.sh EfCoreMigrationsBundle && \
    apt-get purge -y dos2unix && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/sh", "./apply-migrations.sh"]
