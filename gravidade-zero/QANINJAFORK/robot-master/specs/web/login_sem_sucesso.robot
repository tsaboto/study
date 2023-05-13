*** Settings ***
Documentation   O usuário informa suas credenciais incorretas e é notificado com uma mensagem de alerta 
Resource        ../../resources/web/steps/login_steps.robot
Test Template   Logando com credenciais inválidas devo ver uma mensagem de alerta

Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Test Cases ***
Senha inválida              estanqueiro@ninjaplus.com   asdfgh      Usuário e/ou senha inválidos
Usuário não cadastrado      padrekevedo@nokziste.com    123456      Usuário e/ou senha inválidos
Email não informado         ${EMPTY}                    123456      Opps. Cadê o email?
Senha não informada         estanqueiro@ninjaplus.com   ${EMPTY}    Opps. Cadê a senha?