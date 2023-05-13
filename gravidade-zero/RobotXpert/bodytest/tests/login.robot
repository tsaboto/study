***Settings***
Documentation       Suite de teste de Login do Administrador

Library             Browser



***Test Cases***
Login do Administrador
    New Browser     chromium    False
    New Page        https://bodytest-web-tsaboto.herokuapp.com/

    Fill Text       css=input[name=email]       admin@bodytest.com
    Fill Text       css=input[name=password]    pwd123
    Click           text=Entrar
    Get Text        css=aside strong    should be   Administrador

    Take Screenshot 

Senha incorreta
    New Browser     chromium    False
    New Page        https://bodytest-web-tsaboto.herokuapp.com/

    Fill Text       css=input[name=email]       admin@bodytest.com
    Fill Text       css=input[name=password]    abc123
    Click           text=Entrar
    
    # Wait For Elements State     css=.Toastify__toast-body   visible     5
    # Get Text        css=.Toastify__toast-body   should be   Usuário ou senha inválido

    Wait For Elements State     css=.Toastify__toast-body >> text=Usuário ou senha inválido   visible     5
    
    Take Screenshot     selector=.Toastify__toast

Email incorreto
    New Browser     chromium    False
    New Page        https://bodytest-web-tsaboto.herokuapp.com/

    Fill Text       css=input[name=email]       admin&bodytest.com
    Fill Text       css=input[name=password]    pwd123
    Click           text=Entrar

    Wait For Elements State     css=form span >> text=Informe um e-mail válido   visible     5
    
    Take Screenshot


Senha não informado
    New Browser     chromium    False
    New Page        https://bodytest-web-tsaboto.herokuapp.com/

    Fill Text       css=input[name=email]       admin@bodytest.com
    Fill Text       css=input[name=password]    ${EMPTY}
    Click           text=Entrar

    Wait For Elements State     css=form span >> text=A senha é obrigatória   visible     5
    
    Take Screenshot

Email não informado
    New Browser     chromium    False
    New Page        https://bodytest-web-tsaboto.herokuapp.com/

    Fill Text       css=input[name=email]       ${EMPTY}
    Fill Text       css=input[name=password]    pwd123
    Click           text=Entrar

    Wait For Elements State     css=form span >> text=O e-mail é obrigatório  visible     5
    
    Take Screenshot
    
Email e senha não informado
    [Tags]      temp
    New Browser     chromium    False
    New Page        https://bodytest-web-tsaboto.herokuapp.com/

    Fill Text       css=input[name=email]       ${EMPTY}
    Fill Text       css=input[name=password]    ${EMPTY}
    Click           text=Entrar

    Wait For Elements State     css=form span >> text=O e-mail é obrigatório  visible     5
    Wait For Elements State     css=form span >> text=A senha é obrigatória   visible     5

    
    Take Screenshot