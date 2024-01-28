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
  && pip install bash-language-server dockerfile-language-server-nodejs javascript-typescript-langserver jedi-language-server  pyright  python-lsp-server   sql-language-server texlab typescript-language-server unified-language-server vscode-css-languageserver-bin vscode-html-languageserver-bin vscode-json-languageserver-bin yaml-language-server jupyterlab-language-pack-zh-CN \
  && dotnet interactive jupyter install 

