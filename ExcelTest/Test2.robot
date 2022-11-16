*** Settings ***
Library        SeleniumLibrary
Library        ExcelLibrary
Resource       ..//Resource.robot
Test Setup     Open Browser To Login Page
Test Teardown  Close Browser

*** Test Cases ***
Invalid Login Test   
    ${username}         Read Login Data    ${CURDIR}${/}..\\Data\\Data.xlsx    login      3       1
    Log To Console    ${username}    
    ${password}         Read Login Data    ${CURDIR}${/}..\\Data\\Data.xlsx    login      3       2
    Log To Console    ${password}
    Login With Invalid Credentials Should Fail       ${username}      ${password}
