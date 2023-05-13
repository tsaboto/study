*Settings*

Documentation       Test suite for character registration
Library             ${EXECDIR}/resources/factories/users.py


Resource            ${EXECDIR}/resources/base.robot

Test Setup          Start Session
Test Teardown       End Session


*Test Cases*
Must register a new character
    [Tags]  happy

    ${user}     Factory Yoda
   
    Go To User Form
    Fill User Form                  ${user}
    Select Jedi                     ${user}[tpjedi]
    Check Accept Comunications
    Submit User Form      
    Toaster Message Should base     Usuário cadastrado com sucesso!
    Go To User Form
    Go to Home Page
    User Should Be visible          ${user}

Wrong Email
    [Tags]  invalid

    ${user}     Factory Darth Vader
   
    
    Go To User Form     
    Fill User Form      ${user}       
    Check Accept Comunications
    Submit User Form
    Toaster Message Should base     Oops! O email é incorreto.