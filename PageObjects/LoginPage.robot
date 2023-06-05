*** Settings ***
Documentation           Page Objects for Login Keywords
...                     Author: Rae Azcueta
Library                 SeleniumLibrary
Variables               ../ConfigEnvironment.py

*** Keywords ***
Start Test Case
    [Arguments]         ${server}=https://www.ghd.com     ${browser}=chrome
    Open Browser        ${server}       ${browser}
    Maximize Browser Window

End Test Case
    Close Browser

Allow Cookies
    Click Element       id:cookie-bar-button