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
mode 58,19
color 1f
set op=MAIN
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
echo    [3] Donate...
echo.  
echo    [X] Sair
echo.
set /p "op=Escolha o que deseja: "

if %op%==1 goto LOCK
if %op%==2 goto UNLOCK
if %op%==3 goto DONATE
if %op%==X goto EXIT
if %op%==x goto EXIT
if %op% NEQ 1 goto INVALID
if %op% NEQ 2 goto INVALID
if %op% NEQ 3 goto INVALID
if %op% NEQ X goto INVALID
if %op% NEQ x goto INVALID

REM ====================================================
REM                        INVALID
REM ====================================================
:INVALID
cls
title PROTEGER PASTA COM SENHA - Opção inválida
mode 56,15
color 4f
echo.
echo.
echo.
echo.
echo               ###   Opção INVÁLIDA!   ###
echo.
echo.
echo                    Tente novamente.
echo.
echo.
echo.
echo.
pause
goto %op%

REM ====================================================
REM                          LOCK
REM ====================================================
:LOCK
cls
title PROTEGER PASTA COM SENHA - Proteger
mode 60,18
color 1f
set op=LOCK
echo.
echo.
echo.
echo                      PROTEGER PASTA
echo.
set /p "folder=- Informe a PASTA que deseja proteger: "
if not exist %folder% goto FOLDER-NOT-FOUND
goto CHECK-LOCK
:CONTINUE-LOCK
cd ..
echo.
echo.
echo          *****************************************
echo          **                                     **
echo          **             ATENÇÃO!                **
echo          **   Não há como recuperar a senha.    **
echo          ** Por isso, salve-a num lugar seguro. **
echo          **                                     **
echo          *****************************************
echo.
set /p pass=- Informe uma SENHA para proteção: 
echo.
cd %folder%
echo %pass% >> %pass%.passwordLock
cd ..
icacls %folder% /deny %username%:r>nul
goto LOCKED

REM ====================================================
REM                        LOCKED
REM ====================================================
:LOCKED
cls
title PROTEGER PASTA COM SENHA - Pasta protegida
mode 54,15
color 2f
echo.
echo.
echo.
echo.
echo.
echo            A seguinte pasta foi PROTEGIDA
echo.
echo   Pasta: %folder%
echo.
echo.
echo.
echo.
pause
goto MAIN

REM ====================================================
REM                   ALREADY-PROTECTED
REM ====================================================
:ALREADY-PROTECTED
cls
title PROTEGER PASTA COM SENHA - Pasta já protegida
mode 56,15
color 3f
echo.
echo.
echo.
echo.
echo          ###   A pasta já está PROTEGIDA   ###
echo.
echo.
echo     A pasta informada já está protegida no momento.
echo.
echo.
echo.
echo.
pause
goto MAIN

REM ====================================================
REM                        UNLOCK
REM ====================================================
:UNLOCK
cls
title PROTEGER PASTA COM SENHA - Desproteger
mode 60,14
color 1f
set op=UNLOCK
echo.
echo.
echo.
echo                   DESPROTEGER PASTA
echo.
set /p "folder=- Informe a PASTA que deseja desproteger: "
if not exist %folder% goto FOLDER-NOT-FOUND
goto CHECK-UNLOCK
:CONTINUE-UNLOCK
echo.
echo.
echo.
set /p pass1=- Informe a SENHA: 
echo.
goto VALIDATE-PASS

REM ====================================================
REM                      VALIDATE-PASS
REM ====================================================
:VALIDATE-PASS
cls
title PROTEGER PASTA COM SENHA - Validar senha
mode 54,12
echo.
echo.
echo.
echo.
echo.
echo                    VALIDANDO SENHA
echo.
echo                       AGUARDE.
echo.
echo.
timeout /t 1 /nobreak > nul
cls
echo.
echo.
echo.
echo.
echo.
echo                    VALIDANDO SENHA
echo.
echo                       AGUARDE..
echo.
echo.
timeout /t 1 /nobreak > nul
cls
echo.
echo.
echo.
echo.
echo.
echo                    VALIDANDO SENHA
echo.
echo                       AGUARDE...
echo.
echo.
timeout /t 1 /nobreak > nul
icacls %folder% /grant %username%:f>nul
cd %folder%
if exist %pass1%.passwordLock goto UNLOCKED
if not exist %pass1%.passwordLock goto INCORRECT-PASS

REM ====================================================
REM                      INCORRECT-PASS
REM ====================================================
:INCORRECT-PASS
cls
title PROTEGER PASTA COM SENHA - Senha incorreta
mode 60,16
color 4f
cd ..
icacls %folder% /deny %username%:r>nul
echo.
echo.
echo.
echo                 ###   Senha INCORRETA!   ###
echo.
echo.
echo               A senha informada não é válida.
echo.
echo             Favor informe a senha corretamente.
echo.
echo.
echo                      Tente novamente.
echo.
echo.
pause
goto UNLOCK

REM ====================================================
REM                       UNLOCKED
REM ====================================================
:UNLOCKED
cls
title PROTEGER PASTA COM SENHA - Pasta desprotegida
mode 56,15
color 2f
del %pass1%.passwordLock
echo.
echo.
echo.
echo.
echo.
echo            A seguinte pasta foi DESPROTEGIDA
echo.
echo   Pasta: %folder%
echo.
echo.
echo.
echo.
pause
goto MAIN

REM ====================================================
REM                      NOT-PROTECTED
REM ====================================================
:NOT-PROTECTED
cls
title PROTEGER PASTA COM SENHA - Pasta já desprotegida
mode 58,15
color 3f
echo.
echo.
echo.
echo.
echo          ###   A pasta já está DESPROTEGIDA   ###
echo.
echo.
echo     A pasta informada já está desprotegida no momento.
echo.
echo.
echo.
echo.
pause
goto MAIN

REM ====================================================
REM                     FOLDER-NOT-FOUND
REM ====================================================
:FOLDER-NOT-FOUND
cls
title PROTEGER PASTA COM SENHA - Pasta não encontrada
mode 60,16
color 4f
echo.
echo.
echo.
echo              ###   Pasta NÃO ENCONTRADA!   ###
echo.
echo.
echo      A pasta informada não existe no diretório atual.
echo.
echo        Favor informe o nome da pasta corretamente.
echo.
echo.
echo                      Tente novamente.
echo.
echo.
pause
goto %op%

REM ====================================================
REM                       CHECK-LOCK
REM ====================================================
:CHECK-LOCK
cd %folder% 1>nul 2>nul
if '%errorlevel%' == '0' (goto CONTINUE-LOCK) else (goto ALREADY-PROTECTED)

REM ====================================================
REM                      CHECK-UNLOCK
REM ====================================================
:CHECK-UNLOCK
cd %folder% 1>nul 2>nul
if '%errorlevel%' == '1' (goto CONTINUE-UNLOCK) else (goto NOT-PROTECTED)

REM ====================================================
REM                         DONATE
REM ====================================================
:DONATE
cls
title PROTEGER PASTA COM SENHA - Donate
mode 60,19
color 1f
set op=DONATE
echo.
echo.
echo.
echo                            DONATE
echo.
echo.
echo    Se lhe ajudei de alguma forma, considere me pagar um
echo    café como agradecimento. Obrigado!
echo.
echo    Abaixo, segue as opções disponíveis no momento:
echo.
echo.
echo    [1] PayPal
echo.
echo    [V] Voltar
echo.
set /p "donate= Escolha uma opção: "

if %donate%==1 goto PAYPAL
if %donate%==V goto MAIN
if %donate%==v goto MAIN
if %donate% NEQ 1 goto INVALID
if %donate% NEQ V goto INVALID
if %donate% NEQ v goto INVALID

REM ====================================================
REM                        PAYPAL
REM ====================================================
:PAYPAL
cls
title PROTEGER PASTA COM SENHA - Donate PayPal - Obrigado!
mode 62,16
color 1f
echo.
echo.
echo.
echo                    OBRIGADO PELO APOIO!
echo.
echo.
echo      Direcionando para doação...
echo.
echo      #Compartilhe com seus amigos.
echo.
echo.
echo.
set urlpaypal="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=6XRSGDU6FKWT2&source=url"
rundll32 url.dll,FileProtocolHandler %urlpaypal%
pause
goto %op%