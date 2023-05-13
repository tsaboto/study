*** Settings ***
Resource    ./base_steps.robot

*** Keywords ***
#### Steps
Fazendo login com "${email}" e senha "${pass}"
    Informando credenciais de acesso    ${email}        ${pass}

Devo ver o meu nome "${username}" na área logada
    Wait Until Element Contains     ${SPAN_USER}        ${username}

Logando com credenciais inválidas devo ver uma mensagem de alerta
    [Arguments]                         ${email}        ${pass}             ${expected_message}

    Informando credenciais de acesso    ${email}        ${pass}
    Wait Until Element Contains         ${DIV_ALERT}    ${expected_message}

Informando credenciais de acesso
    [Arguments]     ${email}            ${pass}
    Input Text      ${INPUT_EMAIL}      ${email}
    Input Text      ${INPUT_PASS}       ${pass}
    Click Button    ${BUTTON_SUBMIT}