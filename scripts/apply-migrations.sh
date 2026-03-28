#!/bin/sh
set -e

./EfCoreMigrationsBundle

exec dotnet TodoApp.Web.dll
