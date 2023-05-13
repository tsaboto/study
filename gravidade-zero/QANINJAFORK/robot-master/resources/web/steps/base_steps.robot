*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../elements.robot

*** Variables ***
${DEFAULT_URL}          http://ninjaplus-web:5000/login
${BROWSER}              headlesschrome

*** Keywords ***
Abrir navegador
    Open Browser    ${DEFAULT_URL}  ${BROWSER}
    Set Selenium Implicit Wait  10
    Set Window Size     1280    800

Fechar navegador
    Capture Page Screenshot
    Close Browser