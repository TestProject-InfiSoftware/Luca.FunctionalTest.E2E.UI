*** Settings ***

Library    SeleniumLibrary
Library    OperatingSystem
Library    QWeb
Library    Telnet
*** Variables ***
${EMAIL_FIELD}    css=input[placeholder='Email'] 
${PASSWORD_FIELD}   css=input[placeholder='Mot de passe']
*** Test Cases ***
Test de Connexion à la Page
    SeleniumLibrary.Open Browser    https://luca-dev.spvie.com/Account/Login    chrome    
    Input Text    ${EMAIL_FIELD}    demo-sogeti@spvie.com    
    Input Text   ${PASSWORD_FIELD}         czUG6R3yuWLwLwQq
    SeleniumLibrary.Click Element   xpath=//button[contains(text(), 'Connexion')]
    Wait Until Element Is Visible    xpath=//span[contains(@class, 'material-icons') and contains(@class, 'ng-star-inserted') and text()='calculate']    50s  
    # Element Should Be Enabled    xpath=//span[contains(@class, 'material-icons') and contains(@class, 'ng-star-inserted') and text()='calculate']  