*** Settings ***
Library           SeleniumLibrary
Default Tags      Functional
Documentation     A test suite containing tests related to login.

*** Test Cases ***
ValidLoginTest
    [Documentation]              This test relates to valid login to OrangeHRM.
    Open Browser To Login Page
    Input Username               Admin
    Input Password               admin123
    Sleep                        ${Timer}    
    Submit Credentials
    Sleep                        ${Timer}    
    Close Browser  
    
InvalidLoginTest
    [Documentation]              This test relates to invalid login to OrangeHRM
    Open Browser To Login Page
    Input Username               admin
    Input Password               admin
    Sleep                        ${Timer}    
    Submit Credentials
    Sleep                        ${Timer}    
    Close Browser     
    
Invalid LoginTest1
    [Tags]                      Regression
    Open Browser To Login Page
    Input Username               admin
    Input Password               admin12
    Sleep                        ${Timer}    
    Submit Credentials
    Sleep                        ${Timer}    
    Close Browser  
    


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
    