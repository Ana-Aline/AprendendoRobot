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
    ${palavra_randomica}    Generate Random String    length=8    chars=[LETTERS]
    ${palavra_randomica}    Convert To Lower Case     ${palavra_randomica} 
    Set Test Variable       ${EMAIL_TEST}             ${palavra_randomica}@qacoders.com.br
    Log                     ${EMAIL_TEST}

Cadastrar o novo usuário criado
    ${body}    Create Dictionary    nome=Fulano da Silva    email=${EMAIL_TEST}    password=teste    administrador=true
    Log    ${body}
    Criar sessão
    ${resposta}    POST On Session    alias=APIServerRest    url=/usuarios    json=${body}
    Log    ${resposta.json()}
    Set Test Variable    ${ID_USUARIO}    ${resposta.json()["_id"]}
    Set Test Variable    ${RESPOSTA}    ${resposta.json()}

Conferir se este usuário foi cadastrado corretamente
    Log   ${RESPOSTA}
    Dictionary Should Contain Item    ${RESPOSTA}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key     ${RESPOSTA}    _id

    