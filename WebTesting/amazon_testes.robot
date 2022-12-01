*** Settings ***
Documentation           Essa suite testa o site da Amazom.com.br
Resource                amazon_resoucers.robot
Test Setup              Abrir o Navegador
Test Teardown           Fechar o Navegador

*** Test Cases ***
Caso de teste 01 : Acesso a Home Page
    [Documentation]      Esse teste verifica o acesso ao site Amazon.com.br
    [Tags]               Home

    Dado que esteja na pagina da Amazom.com.br
    Quando verifico o titulo da pagina
    Então vou para o campo de busca

Caso de teste 02 : Pesquisa de Produto
    [Documentation]    Esse teste verifica a busca e a certificação do produto
    [Tags]             Busca

    Dado que esteja na pagina da Amazom.com.br
    Quando pesquiso por "Xbox series s"
    E clico no botão de pesquisa
    Então verifico o resultado da pesquisa se esta listando o produto "Console Xbox Series S"

Caso de teste 03 : Inclusão no Carrinho
    [Documentation]    Esse teste verifica a escolha do produto e o adiciona no Carrinho
    [Tags]             Carrinho

    Dado que esteja na pagina da Amazom.com.br
    Quando pesquiso por "Xbox series s"
    E clico no botão de pesquisa
    E tenho o resultado da busca
    E clico no produto escolhido
    E adiciono o produto no carrinho
    Então verifico o produto no carrinho