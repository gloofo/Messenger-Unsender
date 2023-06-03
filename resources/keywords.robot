*** Settings ***
Resource                    ../src/core.robot

Library    OperatingSystem

*** Keywords ***
Open Messenger
    [Documentation]         Opens messenger
    Open Browser            https://www.messenger.com/
    ...                     chrome
    Maximize Browser Window

Inputs credentials
    [Documentation]         Get Users Credentials
    ${email}                Get Value From User
    ...                     Enter your email:
    
    ${password}             Get Value From User
    ...                     Enter your password:
    ...                     hidden=${True}
    

    Input Text              ${page.email}
    ...                     ${email}
    
    Input Text              ${page.password}
    ...                     ${password}
    
    Click Element           ${page.loginbtn}
    Wait Until Element Is Visible    
    ...                     ${page.chatsIco}
     

Pause Until OK
    [Documentation]          Scipt is pause until user click OK
    Pause Execution          SELECT THE CHAT YOU WANT TO UNSEND YOUR MESSAGES FIRST THEN CLICK OK

Check Messages
    [Documentation]          temp 
    ${elements}              Get WebElements        ${page.chat}
        Move mouse                offset:1085,539
        Press Mouse Button        middle
        Sleep                     1s
        Move mouse                offset:926,310

