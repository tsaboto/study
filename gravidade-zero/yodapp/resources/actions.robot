*Settings*
Documentation       Yodapp custom actions


*Keywords*
Go to Home Page
    Go To       ${BASE_URL}
    Wait For Elements State     css=.carousel       visible     5

Go To User Form

    Click           text=Novo
    
    #check point para saber que fomos para a pagina de cadastro
    Wait for Elements State     css=.card-header-title >> text=Cadastrar novo usuário
    ...         visible     5

Fill User Form
    [Arguments]     ${user}

    Fill text       css=input[name='nome']          ${user}[name]
    Fill text       css=input[name='email']         ${user}[email]
    
    Select Options By       css=.ordem select          text     ${user}[ordem] 

    Select birthday         ${user}[bdate]
    
    Fill text               id=insta                                ${user}[instagram]


Select Jedi
    [Arguments]         ${tpjedi}        
    
    Click           xpath=//input[@value='${tpjedi}']/../span[@class='check']

Check Accept Comunications

    Click           xpath=//input[@name='comunications']/../span[@class='check'] 


Select birthday
    [Arguments]         ${text_date}
    
    @{date}             Split String      ${text_date}      -  
    
    Click               css=input[name='Data de nascimento']

    Select Options By   xpath=(//header[@class='datepicker-header']//select)[1]
    ...                 text         ${date}[0] 

    Select Options By   xpath=(//header[@class='datepicker-header']//select)[2]
    ...                 value         ${date}[1] 

    Click               xpath=//a[contains(@class, "datepicker-cell")]//span[text()=${date}[2]]


Submit User Form

    Click                   css=button >> text=Cadastrar  

Toaster Message Should base
    [Arguments]         ${expected_message}
    
    ${elements}         Set Variable        css=.toast div 

    Wait for Elements State     ${elements}          visible     5
    Get text                    ${elements}          equal       ${expected_message}

User Should Be visible
    [Arguments]         ${user}
    ${element}          Set Variable        xpath=//td[contains(text(),'${user}[email]')]/..  

    Wait For elements State     ${element}      visible         5
    Get Text                    ${element}      contains        ${user}[name]
    Get Text                    ${element}      contains        ${user}[instagram]