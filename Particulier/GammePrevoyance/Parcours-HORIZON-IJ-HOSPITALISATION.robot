*** Settings ***
Library     QWeb
Resource    ConnectionData.robot


*** Variables ***
${customerBirthday}     06/12/1995
${spouseBirthday}       06/12/1998


*** Test Cases ***
Test de Connexion à la Page
    OpenBrowser    https://luca-dev2.spvie.com/auth/sign-in    chrome
    ${range_locator}=    Set Variable    css:.input-range
    Type Text    Email    demo-sogeti@spvie.com
    Type Text    Mot de passe    czUG6R3yuWLwLwQq
    Click Text    Connexion
    Click Text    Tarificateur
    Scroll    Gamme Prévoyance
    Verify Text    HORIZON GAV
    Click Text    Faire un devis    9
    Type Text    Date de naissance de l'assuré    ${customerBirthday}
    Type Text    Date de naissance du conjoint    ${spouseBirthday}
    Click Element    xpath=//button[@class='ng-star-inserted']
    Type Text    Revenu mensuel brut :    250
    Click Text    Valider
    Scroll    Garanties & Cotisations
    Click Item    devoir de conseil
    Click Element
    ...    xpath=//div/div[1]/div/ng-component/div/form/section[2]/div[2]/div[2]/overlay-devoir-conseil/p-dialog[2]/div/div/div[3]/div/input
    Click Text    Valider
    # Scroll    Nos adhérents ont également choisi...
    Click Text    Seul
    Click Text    Ajouter
    Scroll     Adhérent / Premier assuré
    # Verify Text    Retirer
    # Click Item    devoir de conseil
    # # Execute JavaScript    document.querySelector('.input-range').value = 25; document.querySelector('.input-range').dispatchEvent(new Event('change'));
    # Click Text    Valider
    # SeleniumLibrary.Wait Until Element Is Visible    ${EMAIL_FIELD}
    # QWeb.TypeText    ${EMAIL_FIELD}    your-email@example.com
    # SeleniumLibrary.Wait Until Element Is Visible    ${PASSWORD_FIELD}
    # QWeb.TypeText    ${PASSWORD_FIELD}    your-password
    # QWeb.Click Element    ${SUBMIT_BUTTON}
