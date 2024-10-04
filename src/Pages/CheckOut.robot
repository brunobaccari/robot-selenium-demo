*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     Collections
Resource    ../resources/webdriver.robot
Resource    ../resources/CheckOut.robot
Resource    ../Components/Utils.robot
# Defina aqui o tempo de espera desejado


*** Keywords ***
add Item To Cart
    Wait Until Element Is Visible    ${ADD_TO_CART_BUTTON_SELECTOR}    30s
    Take Screenshot    before_add_to_cart.png
    Click Element    ${ADD_TO_CART_BUTTON_SELECTOR}
    Take Screenshot    after_add_to_cart.png
    Sleep    ${sleep}

go To Cart
    Wait Until Element Is Visible    ${CART_BUTTON_SELECTOR}    30s
    Take Screenshot    cart_view.png
    Click Element    ${CART_BUTTON_SELECTOR}
    Sleep    ${sleep}

proceed To Checkout
    Wait Until Element Is Visible    ${CHECKOUT_BUTTON_SELECTOR}    30s
    Click Element    ${CHECKOUT_BUTTON_SELECTOR}
    Sleep    ${sleep}

enter First Name "${first_name}"
    Wait Until Element Is Visible    ${FIRST_NAME_SELECTOR}    30s
    Input Text    ${FIRST_NAME_SELECTOR}    ${first_name}
    Take Screenshot    checkout_first_name.png
    Sleep    ${sleep}

enter Last Name "${last_name}"
    Wait Until Element Is Visible    ${LAST_NAME_SELECTOR}    30s
    Input Text    ${LAST_NAME_SELECTOR}    ${last_name}
    Take Screenshot    checkout_last_name.png
    Sleep    ${sleep}

enter Postal Code "${postal_code}"
    Wait Until Element Is Visible    ${POSTAL_CODE_SELECTOR}    30s
    Input Text    ${POSTAL_CODE_SELECTOR}    ${postal_code}
    Take Screenshot    checkout_postal_code.png
    Sleep    ${sleep}

click Finish
    Wait Until Element Is Visible    ${FINISH_BUTTON_SELECTOR}    30s
    Take Screenshot    finish_view.png
    Click Button    ${FINISH_BUTTON_SELECTOR}
    Sleep    ${sleep}

confirm Checkout
    Wait Until Element Is Visible    ${CONFIRM_CHECKOUT_SELECTOR}    30s
    Click Button    ${CONFIRM_CHECKOUT_SELECTOR}
    Wait Until Page Contains    Thank you for your order!
    Sleep    ${sleep}
