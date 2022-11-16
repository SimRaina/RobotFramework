*** Settings ***
Library           SeleniumLibrary
Default Tags      Functional
Documentation     A test suite containing tests related to login.
Test Setup       Open Browser To Login Page
Test Teardown    Close Browser
Resource         ../Resource.robot

*** Test Cases ***
ValidLoginTest
    [Documentation]              This test relates to valid login to OrangeHRM.
    Input Username               Admin
    Input Password               admin123
    Sleep                        ${Timer}    
    Submit Credentials
    Sleep                        ${Timer}  
    
InvalidLoginTest
    [Documentation]              This test relates to invalid login to OrangeHRM
    Input Username               admin
    Input Password               admin
    Sleep                        ${Timer}    
    Submit Credentials
    Sleep                        ${Timer}    
    Login Should Have Failed
    
Invalid LoginTest1
    [Tags]                      Regression
    Input Username               admin
    Input Password               admin12
    Sleep                        ${Timer}    
    Submit Credentials
    Sleep                        ${Timer}    
    Login Should Have Failed    
    
    