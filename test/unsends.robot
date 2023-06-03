*** Settings ***
Resource                    ../src/core.robot

*** Test Cases ***
Login page
    [Documentation]          Loging in with credentials
    Inputs credentials

Pause Until Hits OK
    [Documentation]           Scipt is pause until user click OK
    Pause Until OK

x
    Check Messages