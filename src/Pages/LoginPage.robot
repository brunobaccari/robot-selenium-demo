*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     Collections
Resource    ../resources/webdriver.robot
Resource    ../resources/LoginPage.robot
Resource    ../Components/Utils.robot
# Defina aqui o tempo de espera desejado


*** Keywords ***
you open Login Page
    Close All Browsers

    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    IF    '${headless}' == 'True'
        Call Method    ${options}    add_argument    --headless
    END

    IF    '${anonymousTab}' == 'True'
        Call Method    ${options}    add_argument    --incognito
    END

    FOR    ${arg}    IN    @{arguments}
        Call Method    ${options}    add_argument    ${arg}
    END

    Create Webdriver    Chrome    options=${options}
    Maximize Browser Window

    Go To    ${URL}
    Sleep    ${sleep}

    Take Screenshot    login_page.png

enter Username "${username}"
    Wait Until Element Is Visible    ${USERNAME_SELECTOR}    30s
    Input Text    ${USERNAME_SELECTOR}    ${username}
    Sleep    ${sleep}

enter Password "${password}"
    Wait Until Element Is Visible    ${PASSWORD_SELECTOR}    30s
    Input Text    ${PASSWORD_SELECTOR}    ${password}
    Sleep    ${sleep}

click Login
    Wait Until Element Is Visible    ${LOGIN_BUTTON_SELECTOR}    30s
    Take Screenshot    before_login.png
    Click Element    ${LOGIN_BUTTON_SELECTOR}
    Take Screenshot    after_login.png
    Sleep    ${sleep}

it should be logged in
    Wait Until Element Is Visible    ${APP_LOGO}    30s
