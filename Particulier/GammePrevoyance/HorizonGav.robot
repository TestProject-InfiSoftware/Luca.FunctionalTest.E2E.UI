*** Settings ***
Library    QWeb

*** Test Cases ***
Test de Connexion à la Page
        OpenBrowser  https://luca-dev2.spvie.com/auth/sign-in   chrome   
        Type Text    Email    demo-sogeti@spvie.com  
        Type Text    Mot de passe   czUG6R3yuWLwLwQq  
        Click Text    Connexion
        Click Text    Tarificateur
        Scroll        Gamme Prévoyance
        Verify Text    HORIZON GAV
        Click Text    Faire un devis    9
    # SeleniumLibrary.Wait Until Element Is Visible    ${EMAIL_FIELD}
    # QWeb.TypeText     ${EMAIL_FIELD}    your-email@example.com
    # SeleniumLibrary.Wait Until Element Is Visible    ${PASSWORD_FIELD}
    # QWeb.TypeText     ${PASSWORD_FIELD}    your-password
    # QWeb.Click Element    ${SUBMIT_BUTTON}