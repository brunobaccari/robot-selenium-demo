*** Settings ***
Library             SeleniumLibrary
Resource            ../TestCases/Login.robot

Test Teardown    Capture Final State And Close


*** Test Cases ***
CT: Login Successfully
    [Documentation]    Executa o teste de login
    [Tags]    @login
    Run Keyword    Login Successfully

CT: Run Login and Checkout Test
    [Documentation]    Executa o teste de login e checkout.
    [Tags]    @checkout
    Run Keyword    Login And Checkout

*** Keywords ***
Capture Final State And Close
    TRY
        Capture Page Screenshot
    FINALLY
        Close All Browsers
    END
