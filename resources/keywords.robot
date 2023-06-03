*** Settings ***
Resource                    ../src/core.robot

Library    OperatingSystem
Library    Process

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
    Pause Execution          SELECT THE CHAT YOU WANT TO UNSEND YOUR MESSAGES FIRST THEN CLICK OK, I SUGGEST TO LOAD ALL YOUR MESSAGES FROM THE TOP BEFORE STARTING.

Check Messages
    [Documentation]          Unsends Messages
    ${elements}              Get WebElements        ${page.chat}

    FOR    ${element}    IN  @{elements}
        Sleep    1s
        Mouse Over           ${element}
        Sleep    1s
        Execute Javascript                   document.querySelector("div[aria-label='More']").click();
        Execute Javascript                   document.querySelector("div[aria-label='Remove message']").click();
        Wait Until Element Is Visible        css:div[aria-label='Remove'][tabindex='0']
        Execute Javascript                   document.querySelector("div[aria-label='Remove'][tabindex='0']").click();
        Wait Until Element Is Not Visible    css:div[aria-label='Remove'][tabindex='0']
    END    
