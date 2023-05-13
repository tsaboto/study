*** Settings ***
Library     OperatingSystem
Resource    ./base_api.robot

*** Test Cases ***
Update an user
    remove user by email    paulo@gmail.com
    &{user}                 create dictionary       full_name=Paulo                email=paulo@gmail.com    password=pwd123
    ${user_id}=             post user return id     ${user}

    ${body}=                create dictionary       full_name=Paulo Estanqueiro    email=paulo@gmail.com    password=pwd123
    ${response}=            put user                ${user_id}                     ${body}
    ${code}=                convert to string       ${response.status_code}
    should be equal         ${code}                 200

# Implementar o put

# Passo 1: crio o usuário
# Passo 2: autentico o usuário
# Passo 3: atualizo os dados (PUT)
# Passo 4: consulto o usuário