@echo off
Title: CRUD - BATCH
:inicio
cls
echo.
echo =========================
echo Gerenciamento de Clientes
echo =========================
echo [N] Novo Cliente
echo [L] Listagem Clientes
echo [C] Consultar Clientes
echo [E] Excluir Clientes
echo [F] Finalizar Programa
echo =========================
set /p op=Escolha uma opcao: 
if /i %op% equ n (goto:gravar)
if /i %op% equ l (goto:listar)
if /i %op% equ c (goto:consultar)
if /i %op% equ e (goto:excluir)
if /i %op% equ f (exit) else (
	echo.
	echo -------------------
	echo   Opcao Invalida!
	echo -------------------
	echo.
	pause
	goto:inicio)

:gravar
Title Cadastro de Clientes
cls
echo.
set /p cpf=Digite o CPF do Cliente: 
set /p nome=Digite o Nome do CLiente: 
echo.
echo %cpf%      %nome% >> lista.txt
echo.
echo -----------------------------
echo Cadastro realizado com exito!
echo -----------------------------
echo.
set /p resp=Deseja realizar novo cadastro? [S/N]: 
if /i %resp% equ s (goto:gravar) else (goto:inicio)

:listar
Title Listagem de Clientes
echo.
echo -----------Resultado de Listagem-------------------
echo CPF		   NOME DO CLIENTE		
echo ---------------------------------------------------
type 	        lista.txt
echo ---------------------------------------------------
echo.
pause
goto:inicio

:consultar
Title Consulta de Clientes
echo.
set /p busca=Digite um parametro de pesquisa: 
echo -----------Resultado de Consulta-------------------
echo CPF	           NOME DO CLIENTE		
echo ---------------------------------------------------
     Findstr /i "%busca%" lista.txt
echo ---------------------------------------------------
echo.
set /p resp=Deseja realizar nova consulta? [S/N]:
if /i %resp% equ s (goto:consultar) else (goto:inicio)

:excluir
Title Excluir Clientes
cls
echo.
set /p contato=Digite CPF ou Nome do Cliente a ser excluido: 
Findstr /i "%contato%" lista.txt
::errorlevel equ 0 (houve exito no processo)
::errorlevel equ 1 (nao houve exito)
if %errorlevel% equ 0 (
	findstr /i /v "%contato%" lista.txt > lixo.txt
	del lista.txt
	rename lixo.txt lista.txt
	echo.
	echo.
	echo ------------------------------
	echo Registro Excluido com Sucesso!
	echo ------------------------------
	echo.
	pause
	goto:inicio) else (
	echo.
	echo -----------------------------
	echo   Parametro nao encontrado!
	echo -----------------------------
	echo.
	pause
	goto:inicio)