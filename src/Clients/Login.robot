*** Settings ***
Library             SeleniumLibrary
Resource            ../TestCases/Login.robot

Test Teardown       Close Browser


*** Test Cases ***
CT: Login Successfully
    [Documentation]    Executa o teste de login
    [Tags]    @login
    Run Keyword    Login Successfully

CT: Run Login and Checkout Test
    [Documentation]    Executa o teste de login e checkout.
    [Tags]    @checkout
    Run Keyword    Login And Checkout
