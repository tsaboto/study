***Settings***
Documentation    Suite para testar a classe ContaLibrary
Library          app/ContaLibrary.py


***Test Cases***
Quando eu abro abro uma nova conta deve retornar saldo Zerado
    Abrir conta

    ${saldo_final}      Obter saldo
    ${saldo_esperao}    Convert To Number    0.0

    # Log     ${saldo_final}

    should Be Equal    ${saldo_final}    ${saldo_esperao} 

Quando faço um deposito deve refletir o valor no meu saldo
    Abrir conta

    ${valor_deposito}    Convert To Number    100 
    Deposita             ${valor_deposito}

    ${saldo_final}      Obter Saldo

    Should Be Equal    ${valor_deposito}    ${valor_deposito} 

Quando faço um saque deve deduzir o valor do meu saldo mais a taxa de saque
    Abrir conta

    ${valor_deposito}    Convert To Number    4500    
    Deposita             ${valor_deposito}

    ${valor_saque}    Convert To Number    500 
    Saca              ${valor_saque}

    ${valor_esperado}       Evaluate    ${valor_deposito} - ${valor_saque} -2
    ${saldo_final}          Obter Saldo

    Should Be Equal         ${saldo_final}      ${valor_esperado} 
