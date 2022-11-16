*** Settings ***
Library           SeleniumLibrary
  

*** Test Cases ***
FirstTest
    Open Browser To Login Page
    Input Username
    Input Password
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
${Username}             Admin
${Password}             admin123

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
    Input Text                                   username                    ${Username} 
    
Input Password 
    Input Text                                   password                    ${Password}
    
Submit Credentials
    Click Button                 //form/div[3]/button
    