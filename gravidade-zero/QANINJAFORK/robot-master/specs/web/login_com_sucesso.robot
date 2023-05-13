*** Settings ***
Documentation   O usuário informa suas credenciais de acesso e submete o formulário de login 
Resource        ../../resources/web/steps/login_steps.robot

Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Test Cases ***
Login com sucesso
    Fazendo login com "estanqueiro@ninjaplus.com" e senha "pwd123"
    Devo ver o meu nome "Estanqueiro" na área logada