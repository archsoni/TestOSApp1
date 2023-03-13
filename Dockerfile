#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/runtime:6.0 AS base
WORKDIR /app
ENV LD_LIBRARY_PATH="/app/clidriver/lib/"
RUN apt-get -y update && apt-get install -y libxml2

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["TestOSApp1.csproj", ""]
RUN dotnet restore "./TestOSApp1.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "TestOSApp1.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "TestOSApp1.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENV PATH=$PATH:/app/clidriver/lib:/app/clidriver/adm
#ENTRYPOINT ["dotnet", "TestOSApp1.dll"]
CMD tail -f /dev/null