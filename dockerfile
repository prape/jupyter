FROM jupyter/base-notebook:latest
LABEL MAINTAINER="yunsuan"
USER root
RUN wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb\
  && dpkg -i ./packages-microsoft-prod.deb \
  && apt update \
  && apt install -y  dotnet-sdk-8.0 \
  && apt autoremove -y \
  && rm packages-microsoft-prod.deb
USER $NB_UID
RUN  dotnet new tool-manifest \
  && dotnet tool install   Microsoft.dotnet-interactive \
  && dotnet interactive jupyter install
