*** Settings ***
Resource    ../resources/severest_tests_recursos.resource

*** Variables ***

*** Test Cases ***
Cenário com GET: Consultar os dados de um novo usuário
    Criar um novo usuário
    Cadastrar o novo usuário criado
    Consultar os dados do usuário
    Conferir os dadso retornados do novo usuário