*** Settings ***
Resource    ./base_api.robot

*** Test Cases ***
Delete an user
    remove user by email    paulo@ninjaplus.com
    &{user}                 create dictionary       full_name=Paulo     email=paulo@ninjaplus.com    password=pwd123
    ${user_id}=             post user return id     ${user}

    ${response}=            delete user             ${user_id}
    ${code}=                convert to string       ${response.status_code}
    should be equal         ${code}                 204

Delete inexistent user
    ${user_id}=             convert to string       9999                       
    ${response}=            delete user             ${user_id}
    ${code}=                convert to string       ${response.status_code}
    should be equal         ${code}                 404