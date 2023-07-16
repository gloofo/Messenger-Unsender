*** Settings ***
Resource                    ../src/core.robot

*** Test Cases ***
Login page
    [Documentation]           Loging in with credentials
    Inputs credentials

Pause Until Hits OK
    [Documentation]           Scipt is pause until user click OK
    Pause Until OK

Check for more Messages
    [Documentation]           Checks for more messages to unsend
    Check Messages