#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM shimat/ubuntu18-dotnetcore3.1-opencv4.5.0:20201030 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build
WORKDIR /src
COPY ["OpencvsharpSegmentationFault.csproj", "."]
RUN dotnet restore "./OpencvsharpSegmentationFault.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "OpencvsharpSegmentationFault.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "OpencvsharpSegmentationFault.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "OpencvsharpSegmentationFault.dll"]
#CMD ["bash"]