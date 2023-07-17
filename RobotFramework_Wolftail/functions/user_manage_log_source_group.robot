*** Settings ***
Resource        ../resources/locator.robot

*** Keyword ***
User Goto Log Source Group Management Page
            Wait Until Element Is Visible       xpath:${MENU_BTN}                   ${TIMEOUT}
            Click Element                       xpath:${MENU_BTN}
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_TXA}       ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_TXA}

User Can Verify Information On Log Source Group Management Page
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_TXT}          ${TIMEOUT}
 
User Can Create Log Source Group On Log Source Group Management Page
            Wait Until Element Is Visible       xpath:${CREATE_LOG_SOURCE_GROUP_BTN}         ${TIMEOUT}
            Click Element                       xpath:${CREATE_LOG_SOURCE_GROUP_BTN}   

User Can Verify TextFill On Create New Log Source Group Page
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_NAME_TXF}          ${TIMEOUT}
            Sleep                               3s        
            Element Text Should Be              xpath:${LOG_SOURCE_GROUP_NAME_TXF}              \             
            Element Text Should Be              xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF}       \ 
  
User Can Input Information Log Source Group
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_NAME_TXF}                ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_NAME_TXF}
            Input text                          xpath:${LOG_SOURCE_GROUP_NAME_TXF}                     ${LOG_SOURCE_GROUP_NAME}
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF}              ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF} 
            Input text                          xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF}              ${LOG_SOURCE_GROUP_DES}
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_NEW_CREATE_BTN}                ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_NEW_CREATE_BTN}

# User Can See Tenant Information After Create On Tenant Management Page 
#             Wait Until Element Is Visible       xpath:${TENANT_ID_TXF}                ${TIMEOUT}
#             Click Element                       xpath:${TENANT_ID_TXF}

User Can Delete Log Source Group After Create On Log Source Group Management
            Sleep                               3s
            User Can Create Log Source Group On Log Source Group Management Page
            Sleep                               3s
            ${random_name}=               Generate Random String  5-12  
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_NAME_TXF}              ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_NAME_TXF} 
            Input text                          xpath:${LOG_SOURCE_GROUP_NAME_TXF}              ${random_name}
            ${random_descript}=               Generate Random String  999-1000 
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF}       ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF} 
            Input text                          xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF}       ${random_descript}
            Sleep                               3s
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_NEW_CREATE_BTN}        ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_NEW_CREATE_BTN}
            ${i}=      Set Variable    1
            FOR     ${i}    IN RANGE            1               10 
                        Sleep                               3s
                        ${text}=             Get Text                    xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[1]/div/div[2]/div/ul/li[${i}]/button/span[2]/div/span
                        log to console      ${\n}${text} <<<
                        IF  "${text}" == "${random_name}"          
                                Sleep                                   3s
                                log to console      ${\n}${random_name} <<<
                                Click Element           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[1]/div/div[2]/div/ul/li[${i}]/button/span[2]/div/span
                                Wait Until Element Is Visible           xpath:${LOG_SOURCE_GROUP_FUNCITON_BTN}
                                Wait Until Element Is Visible           xpath://p[text()[contains(.,"${random_name}")]]
                                Sleep                        3s
                        ELSE
                                ${i}=               Set Variable            ${i}+1
                        END
                Exit For Loop If    "${text}" == "${random_name}"
            END

User Can Verify Dialog Confirm Delete Log Source Group After Create On Log Source Group Management
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_FUNCITON_BTN}                  ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_FUNCITON_BTN}
            Wait Until Element Is Visible       xpath:${DELETE_LOG_SOURCE_GROUP_BTN}                    ${TIMEOUT}
            Click Element                       xpath:${DELETE_LOG_SOURCE_GROUP_BTN}
            Sleep                               3s
            Wait Until Element Is Visible       xpath://h1[text()[contains(.,"${DIALOG_CONF_DELETE_LOG_SOURCE}")]] 
            Wait Until Element Is Visible       xpath://p[text()[contains(.,"${DIALOG_CONF2_DELETE_LOG_SOURCE}")]] 
            Wait Until Element Is Visible       xpath:${CONF_DELETE_LOG_SOURCE_GROUP}
            Click Element                       xpath:${CONF_DELETE_LOG_SOURCE_GROUP}

User Can Verify Create Log Source Group Duplicate On Log Source Group Management Page
            Sleep                               3s
            User Can Create Log Source Group On Log Source Group Management Page
            User Can Input Information Log Source Group

User Can Verify After Input Data Create Log Source Group Duplicated On Log Source Group Management Page
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_NAME_VRF}                      ${TIMEOUT}
            Wait Until Element Is Visible       xpath:${CREATE_LOG_SOURCE_GROUP_FAIL_NTF}               ${TIMEOUT}
            Sleep                               3s
            Wait Until Element Is Visible       xpath:${CLOSE_CREATE_LOG_SOURCE_GROUP}                  ${TIMEOUT}
            Click Element                       xpath:${CLOSE_CREATE_LOG_SOURCE_GROUP}

User Can Verify After Input Data Create Sub Log Source Group Duplicated On Log Source Group Management Page
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_NAME_VRF}                      ${TIMEOUT}
            Sleep                               3s
            Wait Until Element Is Visible       xpath:${CLOSE_CREATE_LOG_SOURCE_GROUP}                  ${TIMEOUT}
            Click Element                       xpath:${CLOSE_CREATE_LOG_SOURCE_GROUP}
    
User Can Edit Data Log Source Group After Create On Log Source Group Page
            ${i}=      Set Variable    1
            FOR     ${i}    IN RANGE            1               10 
                        Sleep                               3s
                        ${text}=             Get Text                    xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[1]/div/div[2]/div/ul/li[${i}]/button/span[2]/div/span
                        log to console      ${\n}${text} <<<
                        IF  "${text}" == "${LOG_SOURCE_GROUP_NAME}"               
                                Wait Until Element Is Visible           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[1]/div/div[2]/div/ul/li[${i}]/button/span[2]/div/span 
                                log to console      ${\n}${LOG_SOURCE_GROUP_NAME} <<<
                                Click Element           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[1]/div/div[2]/div/ul/li[${i}]/button/span[2]/div/span
                                Wait Until Element Is Visible           xpath:${LOG_SOURCE_GROUP_FUNCITON_BTN}
                                Wait Until Element Is Visible           xpath://p[text()[contains(.,"${LOG_SOURCE_GROUP_NAME}")]]
                        ELSE
                                ${i}=               Set Variable            ${i}+1
                        END
                Exit For Loop If    "${text}" == "${LOG_SOURCE_GROUP_NAME}"
            END
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_FUNCITON_BTN}               ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_FUNCITON_BTN}
            Wait Until Element Is Visible       xpath:${EDIT_LOG_SOURCE_GROUP_BTN}                   ${TIMEOUT}
            Click Element                       xpath:${EDIT_LOG_SOURCE_GROUP_BTN}
            Sleep                               3s
            Click Element                       xpath:${LOG_SOURCE_GROUP_NAME_TXF} 
            Press Keys                          None                                  CTRL+a
            Sleep                               3s
            Press Keys                          None                                  BACKSPACE
            Input text                          xpath:${LOG_SOURCE_GROUP_NAME_TXF}                     ${LOG_SOURCE_GROUP_NAME_EDIT}
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF}              ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF} 
            Press Keys                          None                                  CTRL+a
            Sleep                               3s
            Press Keys                          None                                  BACKSPACE
            Click Element                       xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF} 
            Input text                          xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF}              ${LOG_SOURCE_GROUP_DES_EDIT}
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_NEW_CREATE_BTN}                ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_NEW_CREATE_BTN}
            Wait Until Element Is Visible           xpath://p[text()[contains(.,"${LOG_SOURCE_GROUP_NAME_EDIT}")]]              ${TIMEOUT}
            Wait Until Element Is Visible           xpath:${DATA_LOG_SOURCE_GROUP_NO_ITEM}                                      ${TIMEOUT} 
           
User Can Create Log Source Group On Log Source Group Level           
            ${i}=      Set Variable    1
            FOR     ${i}    IN RANGE            1               10 
                        Sleep                               3s
                        ${text}=             Get Text                    xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[1]/div/div[2]/div/ul/li[${i}]/button/span[2]/div/span
                        log to console      ${\n}${text} <<<
                        IF  "${text}" == "${LOG_SOURCE_GROUP_NAME_EDIT}"               
                                Wait Until Element Is Visible           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[1]/div/div[2]/div/ul/li[${i}]/button/span[2]/div/span 
                                log to console      ${\n}${LOG_SOURCE_GROUP_NAME_EDIT} <<<
                                Wait Until Element Is Visible           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[1]/div/div[2]/div/ul/li[${i}]/button/span[2]/div/div/div/button        ${TIMEOUT}
                                Click Element                           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[1]/div/div[2]/div/ul/li[${i}]/button/span[2]/div/div/div/button
                        ELSE
                                ${i}=               Set Variable            ${i}+1
                        END
                Exit For Loop If    "${text}" == "${LOG_SOURCE_GROUP_NAME_EDIT}"
            END
            Wait Until Element Is Visible           xpath:${DATA_LOG_SOURCE_GROUP_NO_ITEM}                                      ${TIMEOUT}

User Can Input Information New Log Source Group
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_NAME_TXF}                      ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_NAME_TXF}
            Input text                          xpath:${LOG_SOURCE_GROUP_NAME_TXF}                     ${NEW_LOG_SOURCE_GROUP_NAME}
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF}              ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF} 
            Input text                          xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF}              ${NEW_LOG_SOURCE_GROUP_DES}
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_NEW_CREATE_BTN}                ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_NEW_CREATE_BTN}

User Can Verify Information New Log Source Group After Create
            ${i}=      Set Variable    1
            FOR     ${i}    IN RANGE            1               10 
                        Sleep                               3s
                        ${text}=             Get Text                    xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr/td[${i}]/div[2]
                        log to console      ${\n}${text} <<<
                        IF  "${text}" == "${NEW_LOG_SOURCE_GROUP_NAME}"               
                                Wait Until Element Is Visible           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr/td[${i}]/div[2]       ${TIMEOUT} 
                                Element Text Should Be                  xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr/td[${i}]/div[2]       ${NEW_LOG_SOURCE_GROUP_NAME}      
                                log to console      ${\n}${NEW_LOG_SOURCE_GROUP_NAME} <<<
                        ELSE
                                ${i}=               Set Variable            ${i}+1
                        END
                Exit For Loop If    "${text}" == "${NEW_LOG_SOURCE_GROUP_NAME}"
            END

User Can't Delete Log Source Group On Log Source Group Level After Create         
            ${i}=      Set Variable    1
            FOR     ${i}    IN RANGE            1               10 
                        Sleep                               3s
                        ${text}=             Get Text                    xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[1]/div/div[2]/div/ul/li[${i}]/button/span[2]/div/span
                        log to console      ${\n}${text} <<<
                        IF  "${text}" == "${LOG_SOURCE_GROUP_NAME_EDIT}"               
                                Wait Until Element Is Visible           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[1]/div/div[2]/div/ul/li[${i}]/button/span[2]/div/span 
                                log to console      ${\n}${LOG_SOURCE_GROUP_NAME_EDIT} <<<
                                Wait Until Element Is Visible           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[1]/div/div[2]/div/ul/li[${i}]/button/span[2]/div/div/div/button        ${TIMEOUT}
                                Click Element                           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[1]/div/div[2]/div/ul/li[${i}]/button/span[2]/div/div/div/button
                        ELSE
                                ${i}=               Set Variable            ${i}+1
                        END
                Exit For Loop If    "${text}" == "${LOG_SOURCE_GROUP_NAME_EDIT}"
            END
            Sleep                               3s
            ${random_name}=               Generate Random String  5-12  
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_NAME_TXF}              ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_NAME_TXF} 
            Input text                          xpath:${LOG_SOURCE_GROUP_NAME_TXF}              ${random_name}
            ${random_descript}=               Generate Random String  999-1000 
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF}       ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF} 
            Input text                          xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF}       ${random_descript}
            Sleep                               3s
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_NEW_CREATE_BTN}        ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_NEW_CREATE_BTN}
            ${i}=      Set Variable    1
            FOR     ${i}    IN RANGE            1               10 
                        Sleep                               3s
                        ${text}=             Get Text                    xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr/td[${i}]/div[2]
                        log to console      ${\n}${text} <<<
                        IF  "${text}" == "${random_name}"             
                                Wait Until Element Is Visible           xpath://span[text()[contains(.,"${LOG_SOURCE_GROUP_NAME_EDIT}")]] 
                                Click Element                           xpath://span[text()[contains(.,"${LOG_SOURCE_GROUP_NAME_EDIT}")]] 
                                Sleep                                   3s
                                Wait Until Element Is Visible           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr/td[${i}]/div[2]       ${TIMEOUT} 
                                Element Text Should Be                  xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr/td[${i}]/div[2]       ${random_name} 
                                Click Element                           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr/td[${i}]/div[2]
                                Wait Until Element Is Visible           xpath:${LOG_SOURCE_GROUP_FUNCITON_BTN}   
                                log to console      ${\n}${random_name} <<<
                        ELSE
                                ${i}=               Set Variable            ${i}+1
                        END
                Exit For Loop If    "${text}" == "${random_name}"
            END
            User Can Verify Dialog Confirm Delete Log Source Group After Create On Log Source Group Management
            Wait Until Element Is Visible       xpath:${NOTIFY_DELETE_LOG_SOURCE_GROUP}     ${TIMEOUT}
            Element Text Should Be              xpath:${NOTIFY_DELETE_LOG_SOURCE_GROUP}     Delete Log Source Group Failed
            Sleep                               3s
            ${i}=      Set Variable    1
            FOR     ${i}    IN RANGE            1               10 
                        Sleep                               3s
                        ${text}=             Get Text                    xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[${i}]/td[1]/div[2]
                        log to console      ${\n}${text} <<<
                        IF  "${text}" == "${random_name}"             
                                Wait Until Element Is Visible           xpath://span[text()[contains(.,"${LOG_SOURCE_GROUP_NAME_EDIT}")]] 
                                Click Element                           xpath://span[text()[contains(.,"${LOG_SOURCE_GROUP_NAME_EDIT}")]] 
                                Sleep                                   3s
                                Wait Until Element Is Visible           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[${i}]/td[1]/div[2]      ${TIMEOUT} 
                                Element Text Should Be                  xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[${i}]/td[1]/div[2]       ${random_name} 
                                Click Element                           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[${i}]/td[5]/div/div/div/div/button  
                                log to console      ${\n}${random_name} <<<
                        ELSE
                                ${i}=               Set Variable            ${i}+1
                        END
                Exit For Loop If    "${text}" == "${random_name}"
            END

User Can Delete Log Source Group In Log Source Group Level After Create 
            Wait Until Element Is Visible       xpath:${DELETE_LOG_SOURCE_GROUP_BTN}                    ${TIMEOUT}
            Click Element                       xpath:${DELETE_LOG_SOURCE_GROUP_BTN}
            Sleep                               3s
            Wait Until Element Is Visible       xpath://h1[text()[contains(.,"${DIALOG_CONF_DELETE_LOG_SOURCE}")]] 
            Wait Until Element Is Visible       xpath://p[text()[contains(.,"${DIALOG_CONF2_DELETE_LOG_SOURCE}")]] 
            Wait Until Element Is Visible       xpath:${CONF_DELETE_LOG_SOURCE_GROUP}
            Click Element                       xpath:${CONF_DELETE_LOG_SOURCE_GROUP}

User Can Edit Information Sub Log Source Group 
            ${i}=      Set Variable    1
            FOR     ${i}    IN RANGE            1               10 
                        Sleep                               3s
                        ${text}=             Get Text                    xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[${i}]/td[1]/div[2]
                        log to console      ${\n}${text} <<<
                        IF  "${text}" == "${NEW_LOG_SOURCE_GROUP_NAME}"             
                                Wait Until Element Is Visible           xpath://span[text()[contains(.,"${LOG_SOURCE_GROUP_NAME_EDIT}")]] 
                                Click Element                           xpath://span[text()[contains(.,"${LOG_SOURCE_GROUP_NAME_EDIT}")]] 
                                Sleep                                   3s
                                Wait Until Element Is Visible           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[${i}]/td[1]/div[2]       ${TIMEOUT} 
                                Element Text Should Be                  xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[${i}]/td[1]/div[2]       ${NEW_LOG_SOURCE_GROUP_NAME} 
                                Click Element                           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[${i}]/td[1]/div[2]
                                Wait Until Element Is Visible           xpath:${LOG_SOURCE_GROUP_FUNCITON_BTN}  
                                Click Element                           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[${i}]/td[5]/div/div/div/div/button   
                                log to console      ${\n}${NEW_LOG_SOURCE_GROUP_NAME} <<<
                        ELSE
                                ${i}=               Set Variable            ${i}+1
                        END
                Exit For Loop If    "${text}" == "${NEW_LOG_SOURCE_GROUP_NAME}"
            END
            Wait Until Element Is Visible       xpath:${EDIT_LOG_SOURCE_GROUP_BTN}                   ${TIMEOUT}
            Click Element                       xpath:${EDIT_LOG_SOURCE_GROUP_BTN}
            Sleep                               3s
            Click Element                       xpath:${LOG_SOURCE_GROUP_NAME_TXF} 
            Press Keys                          None                                  CTRL+a
            Sleep                               3s
            Press Keys                          None                                  BACKSPACE
            Input text                          xpath:${LOG_SOURCE_GROUP_NAME_TXF}                     ${NEW_LOG_SOURCE_GROUP_NAME_EDIT}
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF}              ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF} 
            Press Keys                          None                                  CTRL+a
            Sleep                               3s
            Press Keys                          None                                  BACKSPACE
            Click Element                       xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF} 
            Input text                          xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF}              ${NEW_LOG_SOURCE_GROUP_DES_EDIT}
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_NEW_CREATE_BTN}                ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_NEW_CREATE_BTN}
            Sleep                               3s
            Wait Until Element Is Visible           xpath://span[text()[contains(.,"${LOG_SOURCE_GROUP_NAME_EDIT}")]]           ${TIMEOUT} 
            Click Element                           xpath://span[text()[contains(.,"${LOG_SOURCE_GROUP_NAME_EDIT}")]]
            Wait Until Element Is Visible           xpath://span[text()[contains(.,"${NEW_LOG_SOURCE_GROUP_NAME_EDIT}")]]       ${TIMEOUT}
            Click Element                           xpath://span[text()[contains(.,"${NEW_LOG_SOURCE_GROUP_NAME_EDIT}")]]
            Wait Until Element Is Visible           xpath:${DATA_LOG_SOURCE_GROUP_NO_ITEM}                                      ${TIMEOUT}

User Can't Create Sub Log Source Group Duplicate On Log Source Group Level           
            ${i}=      Set Variable    1
            FOR     ${i}    IN RANGE            1               10 
                        Sleep                               3s
                        ${text}=             Get Text                    xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[1]/div/div[2]/div/ul/li[${i}]/button/span[2]/div/span
                        log to console      ${\n}${text} <<<
                        IF  "${text}" == "${LOG_SOURCE_GROUP_NAME_EDIT}"               
                                Wait Until Element Is Visible           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[1]/div/div[2]/div/ul/li[${i}]/button/span[2]/div/span 
                                log to console      ${\n}${LOG_SOURCE_GROUP_NAME_EDIT} <<<
                                Wait Until Element Is Visible           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[1]/div/div[2]/div/ul/li[${i}]/button/span[2]/div/div/div/button        ${TIMEOUT}
                                Click Element                           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/div[1]/div/div[2]/div/ul/li[${i}]/button/span[2]/div/div/div/button
                        ELSE
                                ${i}=               Set Variable            ${i}+1
                        END
                Exit For Loop If    "${text}" == "${LOG_SOURCE_GROUP_NAME_EDIT}"
            END
            Wait Until Element Is Visible           xpath:${DATA_LOG_SOURCE_GROUP_NO_ITEM}                                      ${TIMEOUT}

User Can Input Information Sub Log Source Group Duplicate
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_NAME_TXF}                      ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_NAME_TXF}
            Input text                          xpath:${LOG_SOURCE_GROUP_NAME_TXF}                     ${NEW_LOG_SOURCE_GROUP_NAME_EDIT}
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF}              ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF} 
            Input text                          xpath:${LOG_SOURCE_GROUP_DESCRIPTION_TXF}              ${NEW_LOG_SOURCE_GROUP_DES_EDIT}
            Wait Until Element Is Visible       xpath:${LOG_SOURCE_GROUP_NEW_CREATE_BTN}                ${TIMEOUT}
            Click Element                       xpath:${LOG_SOURCE_GROUP_NEW_CREATE_BTN}