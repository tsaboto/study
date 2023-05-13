*** Settings ***
Library     Collections
Library     ../../resources/lib/db.py
Library     JSONLibrary
Library         /Users/tatianesaboto/Library/Python/3.8/lib/python/site-packages/RequestsLibrary

*** Variables ***
${BASE_URL}=                http://ninjaplus-api:3000

*** Keywords ***
Get User
    [Arguments]             ${user_id}
    ${token}=               get token 
    create session          nplus                   ${BASE_URL}
    &{headers}=             create dictionary       Content-Type=application/json   Authorization=${token}
    
    ${response}=            get request             nplus   /user/${user_id}    headers=${headers}
    Log                     ${response.text}
    [Return]                ${response} 

Post User
    [Arguments]             ${body}
    create session          nplus                   ${BASE_URL}
    &{headers}=             create dictionary       Content-Type=application/json

    ${response}=            post request            nplus   /user   data=${body}    headers=${headers}
    Log                     ${response.text}
    [Return]                ${response} 

Post User Return Id
    [Arguments]             ${body}
    create session          nplus                   ${BASE_URL}
    &{headers}=             create dictionary       Content-Type=application/json

    ${response}=            post request            nplus   /user   data=${body}    headers=${headers}
    Log                     ${response.text}
    ${user_id}=             convert to string       ${response.json()['id']}
    [Return]                ${user_id}

Put User
    [Arguments]             ${user_id}              ${body}
    ${token}=               get token 
    create session          nplus                   ${BASE_URL}    
    &{headers}=             create dictionary       Content-Type=application/json   Authorization=${token}
    
    ${response}=            put request             nplus   /user/${user_id}    data=${body}    headers=${headers}
    Log                     ${response.text}
    [Return]                ${response}

Delete User
    [Arguments]             ${user_id}
    ${token}=               get token 
    create session          nplus                   ${BASE_URL}
    &{headers}=             create dictionary       Content-Type=application/json   Authorization=${token}
    
    ${response}=            delete request          nplus   /user/${user_id}    headers=${headers}
    Log                     ${response.text}
    [Return]                ${response} 

Get Token 
    create session          nplus                   ${BASE_URL}
    &{body}=                create dictionary       email=estanqueiro@ninjaplus.com    password=pwd123
    &{headers}=             create dictionary       Content-Type=application/json
    
    ${response}=            post request            nplus   /auth    data=${body}     headers=${headers}
    Log                     ${response.text}
    ${token}=               convert to string       JWT ${response.json()['token']}
    [Return]                ${token} 