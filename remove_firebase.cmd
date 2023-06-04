@echo off

REM Remova o arquivo .firebaserc
del /f /q .firebaserc

REM Remova o diretório .firebase
rd /s /q .firebase

REM Remova o diretório firebase.json
del /f /q firebase.json

echo Arquivos de configuração do Firebase removidos com sucesso.
