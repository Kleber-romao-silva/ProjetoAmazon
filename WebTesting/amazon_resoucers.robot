*** Settings ***
Library                           SeleniumLibrary

*** Variables ***
${BROWSER}                         chrome
${URL}                             https://www.amazon.com.br
${LOGO}                            //a[contains(@aria-label,'Amazon.com.br')]
${HOME_TITULO}                     Amazon.com.br | Tudo pra você, de A a Z.
${CAMPO_BUSCA}                     twotabsearchtextbox
${BTN_BUSCA}                       nav-search-submit-button
${RESULTADO}                       //span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Console Xbox Series S')]
${CARRINHO}                        //input[@name='submit.add-to-cart']
${TXT_CARRINHO}                    //a[contains(@aria-label,'1 item no carrinho')]

*** Keywords ***
Abrir o Navegador
    Open Browser                    browser=${BROWSER}
    Maximize Browser Window        


Fechar o Navegador
    Capture Page Screenshot
    Close Browser


# casos de testes 01
Dado que esteja na pagina da Amazom.com.br
    Go To           ${URL}  
    Wait Until Element Is Visible    locator=${LOGO} 

 Quando verifico o titulo da pagina
    Title Should Be    title=${HOME_TITULO} 

Então vou para o campo de busca
    Element Should Be Visible    locator=${CAMPO_BUSCA}  


#casos de testes 02

Quando pesquiso por "${PRODUTO}"
    Element Should Be Visible    locator=${CAMPO_BUSCA}  
    Input Text    locator=${CAMPO_BUSCA}      text=${PRODUTO}


 E clico no botão de pesquisa
     Click Element    locator=${BTN_BUSCA}


Então verifico o resultado da pesquisa se esta listando o produto "${PRODUTO}"
        Wait Until Element Is Visible    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')]


# Casos de testes 03 

E tenho o resultado da busca
    Wait Until Element Is Visible    locator=${RESULTADO}
     Element Should Be Visible    locator=${RESULTADO}

    
E clico no produto escolhido
    Click Element    locator=${RESULTADO}  


E adiciono o produto no carrinho
    Wait Until Element Is Visible    locator=${CARRINHO} 
    Click Element    locator=${CARRINHO} 


Então verifico o produto no carrinho
    Element Should Be Visible    locator=${TXT_CARRINHO} 

    



