*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     Collections
Resource    ../resources/webdriver.robot
Resource    ../resources/CheckOut.robot
Resource    ../Components/Utils.robot


*** Keywords ***
add Item To Cart
    Wait Until Element Is Visible    ${ADD_TO_CART_BUTTON_SELECTOR}    30s
    Take Screenshot    before_add_to_cart.png
    Click Element    ${ADD_TO_CART_BUTTON_SELECTOR}
    Wait Until Element Contains    css:.shopping_cart_badge    1    10s
    Take Screenshot    after_add_to_cart.png

go To Cart
    Wait Until Element Is Visible    ${CART_BUTTON_SELECTOR}    30s
    Take Screenshot    cart_view.png
    Click Element    ${CART_BUTTON_SELECTOR}
    Wait Until Element Contains    css:.inventory_item_name    Sauce Labs Fleece Jacket    10s
    Element Text Should Be    css:.cart_quantity    1
    Element Text Should Be    css:.inventory_item_price    $49.99

proceed To Checkout
    Wait Until Element Is Visible    ${CHECKOUT_BUTTON_SELECTOR}    30s
    Click Element    ${CHECKOUT_BUTTON_SELECTOR}

enter First Name "${first_name}"
    Wait Until Element Is Visible    ${FIRST_NAME_SELECTOR}    30s
    Input Text    ${FIRST_NAME_SELECTOR}    ${first_name}
    Take Screenshot    checkout_first_name.png

enter Last Name "${last_name}"
    Wait Until Element Is Visible    ${LAST_NAME_SELECTOR}    30s
    Input Text    ${LAST_NAME_SELECTOR}    ${last_name}
    Take Screenshot    checkout_last_name.png

enter Postal Code "${postal_code}"
    Wait Until Element Is Visible    ${POSTAL_CODE_SELECTOR}    30s
    Input Text    ${POSTAL_CODE_SELECTOR}    ${postal_code}
    Take Screenshot    checkout_postal_code.png

click Finish
    Wait Until Element Is Visible    ${FINISH_BUTTON_SELECTOR}    30s
    Take Screenshot    finish_view.png
    Click Button    ${FINISH_BUTTON_SELECTOR}

confirm Checkout
    Wait Until Element Is Visible    ${CONFIRM_CHECKOUT_SELECTOR}    30s
    Wait Until Element Contains    css:.summary_subtotal_label    Item total: $49.99    10s
    Element Text Should Be    css:.summary_tax_label    Tax: $4.00
    Element Text Should Be    css:.summary_total_label    Total: $53.99
    Click Button    ${CONFIRM_CHECKOUT_SELECTOR}
    Wait Until Page Contains    Thank you for your order!
    Page Should Not Contain Element    css:.shopping_cart_badge
