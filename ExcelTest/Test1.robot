*** Settings ***
Library    SeleniumLibrary
Library    ExcelLibrary

*** Test Cases ***
FirstTest    
    ${username}         Read Login Data    ${CURDIR}${/}..\\Data\\Data.xlsx    login      2       1
    Log To Console    ${username}    
    ${password}         Read Login Data    ${CURDIR}${/}..\\Data\\Data.xlsx    login      2       2
    Log To Console    ${password}
    
*** Keywords ***
Read Login Data
    [Arguments]    ${filepath}       ${sheetname}        ${rownum}     ${colnum}
    Open Excel Document        ${filepath}        1
    Get Sheet    ${sheetname}
    ${data}        Read Excel Cell                          ${rownum}               ${colnum}    
    [Return]    ${data}
    Close Current Excel Document