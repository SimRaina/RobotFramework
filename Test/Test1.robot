*** Settings ***
Library           SeleniumLibrary
  

*** Test Cases ***
FirstTest
    Open Browser         https://opensource-demo.orangehrmlive.com/web/index.php               chrome
    Maximize Browser Window
    Set Browser Implicit Wait    4
    Input Text    username    Admin 
    Input Password    password    admin123
    Sleep    3    
    Click Button     //form/div[3]/button
    Sleep    4    
    Close Browser      
