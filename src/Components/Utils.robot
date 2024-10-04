*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     Collections
Resource    ../resources/LoginPage.robot


*** Keywords ***
Take Screenshot
    [Arguments]    ${screenshot_name}
    ${screenshot_path}    Set Variable    ./photos/${screenshot_name}
    Capture Page Screenshot    ${screenshot_path}
    Log    Taking screenshot: ${screenshot_name}
