*** Settings ***
Resource    ./base_api.robot

*** Test Cases ***
Consulte an user
    ${user_id}=                         convert to string       1                       
    ${response}=                        get user                ${user_id}
    ${code}=                            convert to string       ${response.status_code}
    should be equal                     ${code}                 200
    dictionary should contain value     ${response.json()}      Estanqueiro
    dictionary should contain value     ${response.json()}      estanqueiro@ninjaplus.com

User not found
    ${user_id}=                         convert to string       9999                       
    ${response}=                        get user                ${user_id}
    ${code}=                            convert to string       ${response.status_code}
    should be equal                     ${code}                 404