*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser

*** Test Cases ***
When value is 0 and value is set it matches given value
    Go To  ${HOME_URL}
    Input Text  Arvo  10
    Click Button  Aseta
    Page Should Contain  nappia painettu 10 kertaa

When values is greater than 0 and value is set it matches given value
    Go To  ${HOME_URL}
    Click Button  Nollaa
    Page Should Contain  nappia painettu 0 kertaa
    Click Button  Paina
    Click Button  Paina
    Page Should Contain  nappia painettu 2 kertaa
    Input Text  Arvo  8
    Click Button  Aseta
    Page Should Contain  nappia painettu 8 kertaa

When value matches given value it stays the same
    Go To  ${HOME_URL}
    Click Button  Nollaa
    Page Should Contain  nappia painettu 0 kertaa
    Click Button  Paina
    Click Button  Paina
    Click Button  Paina
    Page Should Contain  nappia painettu 3 kertaa
    Input Text  Arvo  3
    Click Button  Aseta
    Page Should Contain  nappia painettu 3 kertaa