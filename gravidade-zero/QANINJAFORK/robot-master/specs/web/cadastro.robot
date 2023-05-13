*** Settings ***
Documentation   Formulário de cadastro de filmes
Resource        ../../resources/web/steps/cadastro_steps.robot

Test Setup      Abrir navegador
Test Teardown   Fechar navegador
*** Variables ***


*** Test Cases ***
Novo Filme
    Dado que estou logado com credenciais válidas
    Quando eu faço o cadastro de um novo filme
    Então este filme deve ser exibido na lista


*** Keywords ***