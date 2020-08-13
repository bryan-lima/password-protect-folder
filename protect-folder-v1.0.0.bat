@echo off

REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
REM Proteger pasta com senha - https://github.com/bryan-lima/password-protect-folder
REM Proteja sua pasta com uma senha local
REM
REM Desenvolvido por BRYAN LIMA
REM Copyright© 2020
REM Versão: 1.0.0
REM
REM Github: @bryan-lima
REM 
REM Se te ajudei de alguma forma, considere me pagar um café como agradecimento
REM https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=6XRSGDU6FKWT2&source=url
REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@chcp 65001 > nul

REM ====================================================
REM                        MAIN
REM ====================================================
:MAIN
cls
title PROTEGER PASTA COM SENHA - Menu
mode 58,18
color 1f
echo.
echo.
echo              Desenvolvido por BRYAN LIMA.
echo      Todos os direitos reservados. Copyright© 2020.
echo                      Versão 1.0.0
echo.
echo.
echo               PROTEGER PASTA COM SENHA
echo.
echo.
echo    [1] Proteger
echo    [2] Desproteger
echo    [X] Sair
echo.
set /p "op=Escolha o que deseja: "

if %op%==1 goto LOCK
if %op%==2 goto UNLOCK
if %op%==X goto EXIT
if %op%==x goto EXIT
if %op% NEQ 1 goto INVALID
if %op% NEQ 2 goto INVALID
if %op% NEQ X goto INVALID
if %op% NEQ x goto INVALID