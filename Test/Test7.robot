*** Settings ***
Library           SeleniumLibrary
Default Tags      Functional
Documentation     A test suite containing tests related to login.
Test Setup       Open Browser To Login Page
Test Teardown    Close Browser

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
    
Invalid LoginTest1
    [Tags]                      Regression
    Input Username               admin
    Input Password               admin12
    Sleep                        ${Timer}    
    Submit Credentials
    Sleep                        ${Timer}    
    


*** Variables ***
${LandingURL}           https://opensource-demo.orangehrmlive.com/web/index.php
${LoginURL}             https://opensource-demo.orangehrmlive.com/web/index.php/auth/login 
${Browser}              chrome  
${LoginTitle}           OrangeHRM
${Timer}                4

*** Keywords ***
Open Browser To Login Page
    Open Browser                  ${LandingURL}              ${Browser}
    Maximize Browser Window
    Login Page Should Be Open
    Set Browser Implicit Wait     ${Timer}
    
Login Page Should Be Open
    Location Should Be            ${LoginURL}  
    Title Should Be               ${LoginTitle}
    
Input Username
    [Arguments]                   ${Username}
    Input Text                                   username                    ${Username} 
    
Input Password 
    [Arguments]                   ${Password}
    Input Text                                   password                    ${Password}
    
Submit Credentials
    Click Button                 //form/div[3]/button
    