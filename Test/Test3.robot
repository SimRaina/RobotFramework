*** Settings ***
Library           SeleniumLibrary
  

*** Test Cases ***
FirstTest
    Open Browser                  ${LandingURL}              ${Browser}
    Maximize Browser Window
    Location Should Be            ${LoginURL}  
    Title Should Be               ${LoginTitle}
    Set Browser Implicit Wait     ${Timer}
    Input Text                    username                    ${Username}  
    Input Password                password                    ${Password}
    Sleep                        ${Timer}    
    Click Button                 //form/div[3]/button
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



    