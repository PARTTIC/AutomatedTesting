*** Settings ***
Resource        ../resources/locator.robot

*** Keyword ***
User Goto Tenant Management Page
            Wait Until Element Is Visible       xpath:${MENU_BTN}                ${TIMEOUT}
            Click Element                       xpath:${MENU_BTN}
            Wait Until Element Is Visible       xpath:${MENU_TENANT_MANAGE_TXT}  ${TIMEOUT}
            Click Element                       xpath:${MENU_TENANT_MANAGE_TXT}

User Can Verify Information On Tenant Management Page
            Wait Until Element Is Visible       xpath:${TENANT_MANAGEMENT_TXA}          ${TIMEOUT}
 
User Can Create Tenant On Tenant Management Page
            Wait Until Element Is Visible       xpath:${TENANT_MANAGEMENT_TXA}          ${TIMEOUT}
            Click Element                       xpath:${CREATE_TENANT_TXA}    

User Can Verify TextFill On Create Tenant Page
            Wait Until Element Is Visible       xpath:${TENANT_ID_TXF}          ${TIMEOUT}
            Sleep                               3s        
            Element Text Should Be              xpath:${TENANT_ID_TXF_VRY}              \             
            Element Text Should Be              xpath:${TENANT_NAME_TXF_VRY}            \ 
            Element Text Should Be              xpath:${TENANT_SHORT_NAME_TXF_VRY}      \
            Element Text Should Be              xpath:${TENANT_DESCRIPTION_VRY}         \

User Can Input Information Tenant
        #     ${random_id}=               Generate Random String  2  [NUMBERS]
            Wait Until Element Is Visible       xpath:${TENANT_ID_TXF}                ${TIMEOUT}
            Click Element                       xpath:${TENANT_ID_TXF}
            Input text                          xpath:${TENANT_ID_TXF}                ${TENANTID}
        #     Input text                          xpath:${TENANT_ID_TXF}                ${random_id}
        #     ${random_name}=               Generate Random String  5-10  
            Wait Until Element Is Visible       xpath:${TENANT_NAME_TXF}              ${TIMEOUT}
            Click Element                       xpath:${TENANT_NAME_TXF} 
        #     Input text                          xpath:${TENANT_NAME_TXF}              ${random_name}
            Input text                          xpath:${TENANT_NAME_TXF}              ${TENANTNAME}
            Wait Until Element Is Visible       xpath:${TENANT_SHORT_NAME_TXF}        ${TIMEOUT}
            Click Element                       xpath:${TENANT_SHORT_NAME_TXF} 
            Input text                          xpath:${TENANT_SHORT_NAME_TXF}        ${TENANTSHNAME}
            Wait Until Element Is Visible       xpath:${TENANT_DESCRIPTION_TXF}       ${TIMEOUT}
            Click Element                       xpath:${TENANT_DESCRIPTION_TXF} 
            Input text                          xpath:${TENANT_DESCRIPTION_TXF}       ${TENANTDESCTION}
            Sleep                               3s
            Wait Until Element Is Visible       xpath:${CREATE_NEW_TENANT_BTN}        ${TIMEOUT}
            Click Element                       xpath:${CREATE_NEW_TENANT_BTN}
            Sleep                               3s
            
User Can See Tenant Information After Create On Tenant Management Page 
            Wait Until Element Is Visible       xpath:${TENANT_ID_TXF}                ${TIMEOUT}
            Click Element                       xpath:${TENANT_ID_TXF}

User Can Delete Tenant After Create On Tenant Management Page
            User Can Create Tenant On Tenant Management Page
            Sleep                               3s
            ${random_id}=               Generate Random String  4  [NUMBERS]
            Wait Until Element Is Visible       xpath:${TENANT_ID_TXF}                ${TIMEOUT}
            Click Element                       xpath:${TENANT_ID_TXF}
        #     Input text                          xpath:${TENANT_ID_TXF}                ${TENANTID}
            Input text                          xpath:${TENANT_ID_TXF}                ${random_id}
            ${random_name}=               Generate Random String  5-12  
            Wait Until Element Is Visible       xpath:${TENANT_NAME_TXF}              ${TIMEOUT}
            Click Element                       xpath:${TENANT_NAME_TXF} 
            Input text                          xpath:${TENANT_NAME_TXF}              ${random_name}
        #     Input text                          xpath:${TENANT_NAME_TXF}              ${TENANTNAME}
            ${random_short_name}=               Generate Random String  5-12 
            Wait Until Element Is Visible       xpath:${TENANT_SHORT_NAME_TXF}        ${TIMEOUT}
            Click Element                       xpath:${TENANT_SHORT_NAME_TXF} 
            Input text                          xpath:${TENANT_SHORT_NAME_TXF}        ${random_short_name}
        #     Input text                          xpath:${TENANT_SHORT_NAME_TXF}        ${TENANTSHNAME}
            ${random_descript}=               Generate Random String  999-1000 
            Wait Until Element Is Visible       xpath:${TENANT_DESCRIPTION_TXF}       ${TIMEOUT}
            Click Element                       xpath:${TENANT_DESCRIPTION_TXF} 
        #     Input text                          xpath:${TENANT_DESCRIPTION_TXF}       ${TENANTDESCTION}
            Input text                          xpath:${TENANT_DESCRIPTION_TXF}       ${random_descript}
            Sleep                               3s
            Wait Until Element Is Visible       xpath:${CREATE_NEW_TENANT_BTN}        ${TIMEOUT}
            Click Element                       xpath:${CREATE_NEW_TENANT_BTN}
            ${i}=      Set Variable    1
            FOR     ${i}    IN RANGE            1               10 
                        Sleep                               3s
                        ${text}=             Get Text                    xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/table/tbody/tr[${i}]/td[2]/div[2]/span
                        log to console      ${\n}${text} <<<
                        IF  "${text}" == "${random_name}"               
                                Wait Until Element Is Visible           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/table/tbody/tr[1]/td[7]/div/div[2]/button
                                log to console      ${\n}${random_name} <<<
                                Click Element           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/table/tbody/tr[${i}]/td[7]/div/div[2]/button
                                Wait Until Element Is Visible       xpath:${DIALOG_DELETE_TENANT_CNF_1}              ${TIMEOUT}
                                Element Text Should Be              xpath:${DIALOG_DELETE_TENANT_CNF_1}              Delete Tenant
                                Wait Until Element Is Visible       xpath:${DELETE_TENANT_CNF_BTN}                   ${TIMEOUT}
                                Click Element                       xpath:${DELETE_TENANT_CNF_BTN} 
                                Wait Until Element Is Not Visible       xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/table/tbody/tr[1]/td[7]/div/div[2]/button
                        ELSE
                                ${i}=               Set Variable            ${i}+1
                        END
                Exit For Loop If    "${text}" == "${random_name}"
            END

User Can Verify Dialog Confirm Delete Tenant On Tenant Management Page
            Sleep                       3s

User Can Verify Create Tenant Duplicate On Tenant Management Page
            Sleep                               3s
            User Can Create Tenant On Tenant Management Page
            Wait Until Element Is Visible       xpath:${TENANT_ID_TXF}                ${TIMEOUT}
            Click Element                       xpath:${TENANT_ID_TXF}
            Input text                          xpath:${TENANT_ID_TXF}                ${TENANTID}
            Wait Until Element Is Visible       xpath:${TENANT_NAME_TXF}              ${TIMEOUT}
            Click Element                       xpath:${TENANT_NAME_TXF} 
            Input text                          xpath:${TENANT_NAME_TXF}              ${TENANTNAME}
            Wait Until Element Is Visible       xpath:${TENANT_SHORT_NAME_TXF}        ${TIMEOUT}
            Click Element                       xpath:${TENANT_SHORT_NAME_TXF} 
            Input text                          xpath:${TENANT_SHORT_NAME_TXF}        ${TENANTSHNAME}
            Wait Until Element Is Visible       xpath:${TENANT_DESCRIPTION_TXF}       ${TIMEOUT}
            Click Element                       xpath:${TENANT_DESCRIPTION_TXF} 
            Input text                          xpath:${TENANT_DESCRIPTION_TXF}       ${TENANTDESCTION}
            Sleep                               3s
            Wait Until Element Is Visible       xpath:${CREATE_NEW_TENANT_BTN}        ${TIMEOUT}
            Click Element                       xpath:${CREATE_NEW_TENANT_BTN}
            Sleep                               3s

User Can Verify After Input Data Create Tenant Duplicated On Tenant Management Page
            Wait Until Element Is Visible       xpath:${VERIFY_TENANTID_DUPLICATED_TXA}              ${TIMEOUT}
            Element Text Should Be              xpath:${VERIFY_TENANTID_DUPLICATED_TXA}              Tenant ID has been Duplicated.
            Wait Until Element Is Visible       xpath:${VERIFY_TENANTNAME_DUPLICATED_TXA}              ${TIMEOUT}
            Element Text Should Be              xpath:${VERIFY_TENANTNAME_DUPLICATED_TXA}            Tenant Name has been Duplicated.
            Wait Until Element Is Visible       xpath:${VERIFY_TENANTSHORT_DUPLICATED_TXA}              ${TIMEOUT}
            Element Text Should Be              xpath:${VERIFY_TENANTSHORT_DUPLICATED_TXA}           Short Name has been Duplicated.
            Sleep                               5s
            Wait Until Element Is Visible       xpath:${CLOSE_TENANT_CREATE_BTN}                   ${TIMEOUT}
            Click Element                       xpath:${CLOSE_TENANT_CREATE_BTN}

User Can Edit Data Tenant After Create On Tenant Management Page
            ${i}=      Set Variable    1
            FOR     ${i}    IN RANGE            1               10 
                        Sleep                               3s
                        ${text}=             Get Text                    xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/table/tbody/tr[${i}]/td[2]/div[2]/span
                        log to console      ${\n}${text} <<<
                        IF  "${text}" == "${TENANTNAME}"               
                                Wait Until Element Is Visible           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/table/tbody/tr[${i}]/td[7]/div/div[1]/div/div/button 
                                log to console      ${\n}${TENANTNAME} <<<
                                Click Element           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/table/tbody/tr[${i}]/td[7]/div/div[1]/div/div/button
                        ELSE
                                ${i}=               Set Variable            ${i}+1
                        END
                Exit For Loop If    "${text}" == "${TENANTNAME}"
            END
            Wait Until Element Is Visible       xpath:${TENANT_ID_TXF}                ${TIMEOUT}
            Click Element                       xpath:${TENANT_ID_TXF}
            Press Keys                          None                                  CTRL+a
            Sleep                               3s
            Press Keys                          None                                  BACKSPACE
            Input text                          xpath:${TENANT_ID_TXF}                ${TENANTID_EDIT}
            Wait Until Element Is Visible       xpath:${TENANT_NAME_TXF}              ${TIMEOUT}
            Click Element                       xpath:${TENANT_NAME_TXF} 
            Press Keys                          None                                  CTRL+a
            Sleep                               3s
            Press Keys                          None                                  BACKSPACE
            Input text                          xpath:${TENANT_NAME_TXF}              ${TENANTNAME_EDIT}
            Wait Until Element Is Visible       xpath:${TENANT_SHORT_NAME_TXF}        ${TIMEOUT}
            Click Element                       xpath:${TENANT_SHORT_NAME_TXF} 
            Press Keys                          None                                  CTRL+a
            Sleep                               3s
            Press Keys                          None                                  BACKSPACE
            Input text                          xpath:${TENANT_SHORT_NAME_TXF}        ${TENANTSHNAME_EDIT}
            Wait Until Element Is Visible       xpath:${TENANT_DESCRIPTION_TXF}       ${TIMEOUT}
            Click Element                       xpath:${TENANT_DESCRIPTION_TXF} 
            Press Keys                          None                                  CTRL+a
            Sleep                               3s
            Press Keys                          None                                  BACKSPACE
            Input text                          xpath:${TENANT_DESCRIPTION_TXF}       ${TENANTDESCTION_EDIT}
            Sleep                               3s
            Wait Until Element Is Visible       xpath:${CREATE_NEW_TENANT_BTN}        ${TIMEOUT}
            Click Element                       xpath:${CREATE_NEW_TENANT_BTN}
            Sleep                               3s
            ${i}=      Set Variable    1
            FOR     ${i}    IN RANGE            1               10 
                        Sleep                               3s
                        ${text}=             Get Text                    xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/table/tbody/tr[${i}]/td[2]/div[2]/span
                        log to console      ${\n}${text} <<<
                        IF  "${text}" == "${TENANTNAME_EDIT}"               
                                Wait Until Element Is Visible           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/table/tbody/tr[${i}]/td[7]/div/div[1]/div/div/button
                                log to console      ${\n}${TENANTNAME_EDIT} <<<
                                # Click Element           xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/table/tbody/tr[${i}]/td[5]/div/div/div/div[1]/div/div/button
                        ELSE
                                ${i}=               Set Variable            ${i}+1
                        END
                Exit For Loop If    "${text}" == "${TENANTNAME_EDIT}"
            END


User Can Verify Domain Tenant On Tenant Management Page            
            Wait Until Element Is Visible                   xpath:xpath:/html/body/div[1]/div[2]/div[2]/div/div/div[2]/div/table/tbody/tr[1]/td[4]/div/div/div/span/span/span

