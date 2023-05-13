**Settings***
Documentation       Trabalhando com condicionais

**Test Cases***
Carteira de Motorista
    ${idade}=   Set Variable    10

    IF      ${idade} >= 18 
        Log To Console         Voce pode tirar sua CNH
    ELSE
        Log To Console          Voce pode andar de bicicleta
    END     

Navegador
    [tags]      browser

    ${browser}=     Set Variable        Chrome

    IF          '${browser}' == 'Firefox'
        Log To Console      Chamando o ${browser}
    ELSE IF     '${browser}' == 'Chrome'
        Log To Console      Chamnado o ${browser}
    ELSE IF     '${browser}' == 'webkit'        
        Log To Console      Chamnado o ${browser} 
    ELSE
        Fail    Navegador incorreto 
    END