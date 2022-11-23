*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library           ExcelLibrary

*** Variables ***
${LandingURL}           https://opensource-demo.orangehrmlive.com/web/index.php
${LoginURL}             https://opensource-demo.orangehrmlive.com/web/index.php/auth/login 
${Browser}              chrome  
${LoginTitle}           OrangeHRM
${Timer}                4
${error messsage}       Invalid credentials
${VALID USER}           Admin
${VALID PASSWORD}       admin123
${DASHBOARD URL}        https://opensource-demo.orangehrmlive.com/web/index.php/dashboard/index

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
    
Login With Invalid Credentials Should Fail
    [Arguments]         ${username}    ${password}
    Input Username        ${username}
    Input Password        ${password}
    Sleep                        ${Timer}
    Submit Credentials
    Sleep                        ${Timer}
    Login Should Have Failed
    
#Login With Invalid Credentials Should Fail
  #  [Arguments]           @{credentials}
  #  Input Username        ${credentials}[0]
  #  Input Password        ${credentials}[1]
    
Login Should Have Failed
    Element Should Contain    //div[@class='oxd-alert-content oxd-alert-content--error']/p     ${error messsage}
    Log    Login is failed and error message is displayed  
    

Read Login Data
    [Arguments]    ${filepath}       ${sheetname}        ${rownum}     ${colnum}
    Open Excel Document        ${filepath}        1
    Get Sheet    ${sheetname}
    ${data}        Read Excel Cell                          ${rownum}               ${colnum}    
    [Return]    ${data}
    Close Current Excel Document