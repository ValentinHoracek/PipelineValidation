FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY src/PipelineValidation/*.csproj ./src/PipelineValidation/
COPY tests/PipelineValidation.Tests/*.csproj ./tests/PipelineValidation.Tests/
RUN dotnet restore src/PipelineValidation/PipelineValidation.csproj

# Copy everything else and build
COPY . .
RUN dotnet publish src/PipelineValidation/PipelineValidation.csproj -c Release -o out

FROM mcr.microsoft.com/dotnet/runtime:8.0
WORKDIR /app
COPY --from=build /app/out ./
ENTRYPOINT ["dotnet", "PipelineValidation.dll"]