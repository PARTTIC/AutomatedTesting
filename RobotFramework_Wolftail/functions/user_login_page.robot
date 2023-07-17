*** Settings ***
Resource        ../resources/locator.robot

*** Keyword ***
Open Chrome Browser Login Should Pass
            Open Browser    ${URL}       Chrome     options=add_experimental_option("excludeSwitches", ["enable-logging"])
            Maximize Browser Window
            Run Keyword And Continue On Failure         Wait Until Element Is Visible       xpath:${ADVANCED_BTN}
            Run Keyword And Continue On Failure         Click Element                       xpath:${ADVANCED_BTN}     
            Run Keyword And Continue On Failure         Wait Until Element Is Visible       xpath:${IP_LINK_TXF}
            Run Keyword And Continue On Failure         Click Element                       xpath:${IP_LINK_TXF}  

User Can Login With Account "${USERNAME}" and Password "${PASSWORD}"
            Wait Until Element Is Visible       xpath:${USERNAME_INPUT}     ${TIMEOUT}
            Input Text                          xpath:${USERNAME_INPUT}     ${USERNAME}  
            Input Text                          xpath:${PASSWORD_INPUT}     ${PASSWORD} 
            Click Element                       xpath:${LOGIN_BTN}                               
            # Sleep                       500s

User Should Found Wolftail Page 
                Wait Until Element Is Visible       xpath:${WELCOME_TXA}                ${TIMEOUT} 