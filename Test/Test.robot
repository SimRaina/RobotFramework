*** Settings ***
Library           SeleniumLibrary


Default Tags     smoke
Suite Setup       Open Browser         https://opensource-demo.orangehrmlive.com/web/index.php               chrome
Suite Teardown    Close Browser

*** Test Cases ***
FirstTest
    Maximize Browser Window
    Set Browser Implicit Wait    4
    Input Text    username    Admin 
    Input Password    password    admin123
    Click Button     //        
    
SecondTest
    [Tags]    sanity
    Maximize Browser Window