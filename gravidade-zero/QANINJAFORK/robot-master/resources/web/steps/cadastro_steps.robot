*** Settings ***
Library     ../../lib/db.py
Resource    ./base_steps.robot

*** Variables ***
# Test Data
${Title}            Resident Evil
${Status}           Disponível
${Year}             2002
${ReleaseDate}      01/12/2002
@{Cast}             Milla Jovovich   Ali Larter  Ian Glen   Shawn Roberts
${Plot}             Alice tem a missão de desativar a rainha vermelha na colméia porque alguém jogou um vírus e deu ruim

*** Keywords ***
Dado que estou logado com credenciais válidas
    Input Text      ${INPUT_EMAIL}      estanqueiro@ninjaplus.com
    Input Text      ${INPUT_PASS}       pwd123
    Click Button    ${BUTTON_SUBMIT}

Quando eu faço o cadastro de um novo filme
    Remove Movie By Title               ${Title}
    Click Button                        ${BUTTON_ADD}       
    Input Text                          ${INPUT_TITLE}      ${Title}
    Click Element                       ${DROP_STATUS}
    Wait Until Element Is Visible       ${OPTION_AVAILABLE}
    Click Element                       ${OPTION_AVAILABLE}
    Input Text                          ${INPUT_YEAR}       ${Year}
    Input Text                          ${INPUT_RDATE}      ${ReleaseDate}
    FOR    ${actor}     IN  @{Cast}
           Input Text   ${INPUT_CAST}   ${actor}
           Press Keys   ${INPUT_CAST}   TAB
           Log          ${actor} 
    END
    Input Text          ${TEXTAREA_PLOT}    ${Plot}
    Click Button        ${BUTTON_CREATE}

Então este filme deve ser exibido na lista
    Wait Until Element contains     ${TABLE_ITEM}       ${Title}