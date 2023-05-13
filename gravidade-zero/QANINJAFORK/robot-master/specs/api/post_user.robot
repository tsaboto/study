*** Settings ***
Library     OperatingSystem
Resource    ./base_api.robot

*** Test Cases ***
Create a new user
    remove user by email                bruce@wayne.com
    # &{body}=                            create dictionary       full_name=Bruce Wayne   email=bruce@wayne.com    password=pwd123
    ${body}                             get file                ${EXECDIR}/resources/json/post_200.json

    ${response}=                        post user               ${body}  
    ${code}=                            convert to string       ${response.status_code}
    should be equal                     ${code}                 200

Name required
    &{body}=                            create dictionary       full_name=${EMPTY}   email=bruce@wayne.com    password=pwd123
    
    ${response}=                        post user               ${body}  
    ${code}=                            convert to string       ${response.status_code}
    should be equal                     ${code}                 412
    dictionary should contain value     ${response.json()}      Validation notEmpty on full_name failed

Email required
    &{body}=                            create dictionary       full_name=Bruce Wayne   email=${EMPTY}    password=pwd123
    
    ${response}=                        post user               ${body}    
    ${code}=                            convert to string       ${response.status_code}
    should be equal                     ${code}                 412
    dictionary should contain value     ${response.json()}      Validation notEmpty on email failed

Password required
    &{body}=                            create dictionary       full_name=Bruce Wayne   email=bruce@wayne.com    password=${EMPTY}
    
    ${response}=                        post user               ${body}             
    ${code}=                            convert to string       ${response.status_code}
    should be equal                     ${code}                 412
    dictionary should contain value     ${response.json()}      Validation notEmpty on password failed