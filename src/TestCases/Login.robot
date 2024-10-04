*** Settings ***
Resource    ../Pages/LoginPage.robot
Resource    ../Pages/CheckOut.robot
Resource    ../Helpers/Gherkin_Pattern.robot


*** Keywords ***
Login And Checkout
    [Documentation]    Cenário onde o usuário faz login e completa o checkout.
    Given you open Login Page
    When Enter Username "standard_user"
    And Enter Password "secret_sauce"
    And Click Login
    And it should be logged in
    And Add Item To Cart
    And Go To Cart
    And Proceed To Checkout
    And Enter First Name "Bruno"
    And Enter Last Name "Baccari"
    And Enter Postal Code "13480000"
    And Click Finish
    Then Confirm Checkout

Login Successfully
    [Documentation]    Cenário onde o usuário faz login e completa o checkout.
    Given you open Login Page
    When Enter Username "standard_user"
    And Enter Password "secret_sauce"
    And Click Login
    Then it should be logged in
