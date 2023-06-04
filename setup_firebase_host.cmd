@echo off

REM Passo 6: Configuração do Firebase Hosting
REM Selecione o projeto Firebase
REM Escolha a opção "Hosting: Configure and deploy Firebase Hosting sites"
REM Selecione o diretório "build/web" como a raiz do seu aplicativo
REM Escolha "Yes" para configurar o aplicativo como Single-page app (SPA)
REM Escolha "Yes" para permitir o redirecionamento de URLs para o arquivo de destino
REM Escolha "Yes" para habilitar o armazenamento em cache de arquivos com HTTP headers

REM Passo 7: Deploy do aplicativo Flutter no Firebase Hosting
firebase deploy --only hosting

echo Configuração do Firebase Hosting concluída e o aplicativo foi implantado com sucesso.