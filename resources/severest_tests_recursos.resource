*** Settings ***
Documentation    O objetivo deste arquivo é armazenar todos os recursos para teste 
Library    RequestsLibrary
Library    String
Library    Collections

*** Keywords ***
Criar sessão
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    alias=APIServerRest    url=https://serverest.dev/    headers=${headers}

Criar um novo usuário
    ${palavra_randomica}    Generate Random String    Length=8    chars=[LETTERS]
    ${palavra_randomica}    Convert To Lower Case     ${palavra_randomica} 
    Set Test Variable       ${EMAIL_TEST}             ${palavra_randomica}@qacoders.com.br
    Log                     ${EMAIL_TEST}
    