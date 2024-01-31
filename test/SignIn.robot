*** Settings ***
Library         SeleniumLibrary
Library    Screenshot

*** Variables ***



*** Test Cases ***
Ebay
    Open Browser            https://www.facebook.com/login/             chrome
    Maximize Browser Window
    Wait Until Element Is Visible    id:email                           10
    Input Text    id:email     andis
    Input Password    id:pass    12345
    Click Button    id:loginbutton
    
    Page Should Contain Element    xpath://*[@id="u_0_1_PL"]/div/div[2]/div/div/div/span[2]
    Take Screenshot