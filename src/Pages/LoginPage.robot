*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     Collections
Resource    ../resources/webdriver.robot
Resource    ../resources/LoginPage.robot
Resource    ../Components/Utils.robot


*** Keywords ***
you open Login Page
    Close All Browsers

    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    IF    '${headless}' == 'True'
        Call Method    ${options}    add_argument    --headless
    END

    ${prefs}    Create Dictionary    credentials_enable_service=${False}    profile.password_manager_enabled=${False}    profile.password_manager_leak_detection=${False}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}

    FOR    ${arg}    IN    @{arguments}
        Call Method    ${options}    add_argument    ${arg}
    END

    Create Webdriver    Chrome    options=${options}
    Maximize Browser Window

    Go To    ${URL}

    Take Screenshot    login_page.png

enter Username "${username}"
    Wait Until Element Is Visible    ${USERNAME_SELECTOR}    30s
    Input Text    ${USERNAME_SELECTOR}    ${username}

enter Password "${password}"
    Wait Until Element Is Visible    ${PASSWORD_SELECTOR}    30s
    Input Password    ${PASSWORD_SELECTOR}    ${password}

click Login
    Wait Until Element Is Visible    ${LOGIN_BUTTON_SELECTOR}    30s
    Take Screenshot    before_login.png
    Click Element    ${LOGIN_BUTTON_SELECTOR}
    Take Screenshot    after_login.png

it should be logged in
    Wait Until Location Contains    /inventory.html    30s
    Wait Until Element Is Visible    css:.inventory_list    30s
