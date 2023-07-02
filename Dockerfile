FROM mcr.hamdocker.ir/dotnet/sdk:7.0 AS build-env
WORKDIR /App

# Copy everything
COPY . .

WORKDIR ./NethereumExplorer.ClientWasm
# Restore as distinct layers
RUN dotnet restore

# Build and publish a release
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.hamdocker.ir/dotnet/aspnet:7.0
WORKDIR /App
COPY --from=build-env /App/NethereumExplorer/out .
ENTRYPOINT ["dotnet", "NethereumExplorer.ClientWasm.dll"]
EXPOSE 5000
EXPOSE 80
EXPOSE 443

