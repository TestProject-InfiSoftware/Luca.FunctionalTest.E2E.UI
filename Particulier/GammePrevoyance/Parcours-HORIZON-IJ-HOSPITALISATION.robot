*** Settings ***
Library     QWeb
# Library  FakerLibrary
Resource    ConnectionData.robot

*** Variables ***
${customerBirthday}     06/12/1995
${spouseBirthday}       06/12/1998

# ${randomValue}=    FakerLibrary.Random Int    0    500
*** Test Cases ***

Test de Connexion à la Page
    OpenBrowser    https://luca-dev2.spvie.com/auth/sign-in    chrome
    Type Text    Email    demo-sogeti@spvie.com
    Type Text    Mot de passe    czUG6R3yuWLwLwQq
    Click Text    Connexion
    Click Text    Tarificateur
    Scroll    Gamme Prévoyance
    Verify Text    HORIZON GAV
    Click Text    Faire un devis    9
    Verify Text    Informations tarifantes
    # ${elements}=    Get Element    devoir de conseil
    Type Text    Date de naissance de l'assuré    ${customerBirthday}
    Type Text    Date de naissance du conjoint    ${spouseBirthday}
    Click Item    devoir de conseil    1
    Type Text    Revenu mensuel brut :    250
    Click Text    Valider
    Verify Text    Garanties & Cotisations
    Click Item    devoir de conseil    2   
    # Execute JavaScript    document.querySelector('.input-range').value = ${randomValue}; document.querySelector('.input-range').dispatchEvent(new Event('change'));
    Execute JavaScript    document.querySelector('.input-range').value = 50; document.querySelector('.input-range').dispatchEvent(new Event('change'));
    Click Text    Valider
    Verify Text    Nos adhérents ont également choisi...
    Click Text    Seul
    # Click Element    css:.btn-default:contains('Ajouter')
    Click Text    Ajouter    1
    Click Item    devoir de conseil    3
    Execute JavaScript    document.querySelector('.input-range').value = 40; document.querySelector('.input-range').dispatchEvent(new Event('change'));
    Click Text    Valider
    Verify Text    Adhérent / Premier assuré
    Type Text    Email    functional-tests@assurware.com
    Type Text    Nom    Lauriat
    Type Text    Nom de naissance    Herosside
    Type Text    Prénom    Nom de naissance
 