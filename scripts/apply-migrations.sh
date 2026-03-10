#!/bin/sh
set -e

# Connection string can be passed as an argument or environment variable
CONNECTION_STRING=${1:-$ConnectionStrings__DefaultConnection}

echo "Applying migrations with connection string: $CONNECTION_STRING"

# Run the bundle
./EfCoreMigrationsBundle --connection "$CONNECTION_STRING"

echo "Migrations applied successfully."

# Start the app
dotnet TodoApp.Web.dll
