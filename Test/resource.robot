*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}             opensource-demo.orangehrmlive.com/web/index.php
${BROWSER}            chrome
${DELAY}              0
${VALID USER}         Admin
${VALID PASSWORD}     admin123
${LOGIN URL}          https://${SERVER}/auth/login
${DASHBOARD URL}      https://${SERVER}/dashboard/index
${ERROR URL}          https://${SERVER}/auth/login

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Browser Implicit Wait    5
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    OrangeHRM

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username     ${username}     

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}    

Submit Credentials
    Click Button    //form/div[3]/button    

Dashboard Page Should Be Open
    Location Should Be    ${DASHBOARD URL}
    Title Should Be    OrangeHRM
