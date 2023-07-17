*** Settings ***
Resource        ../resources/locator.robot

*** Keyword ***
Select Index Data Type LEEF EventLog
            Wait Until Element Is Visible       xpath:${MENU_INDEX_BTN}     ${TIMEOUT}
            Click Element                       xpath:${MENU_INDEX_BTN}
            Wait Until Element Is Visible       xpath:${MENU_INDEX_LEEF_EVENTLOG}   ${TIMEOUT}
            Click Element                       xpath:${MENU_INDEX_LEEF_EVENTLOG}

User Can Search On Filter Bar By Devicename EventLog LEEF
        Wait Until Element Is Visible       xpath:${SEARCH_FILL_TXA}    ${TIMEOUT} 
            Click Element                       xpath:${SEARCH_FILL_TXA}  
            FOR     ${data}    IN          @{devicename}
                    Click Element                       xpath:${SEARCH_FILL_TXA} 
                    Press Keys                          None                        ${data}
                    Press Keys                          None                        ENTER
                    # Select Filter Period
                    # Sleep                               3s
                    # Click Element                       xpath:${SEARCH_FILL_TXA}  
                    # Press Keys                          None                        CTRL+a
                    # Press Keys                          None                        BACKSPACE
            END
            Sleep                                       3s
            ${hits}=        Get Text                    xpath://div[@class="euiText eui-textTruncate css-1kntn8w-euiText-m"]
            ${timestamp}=        Get Text       xpath://span[@class="dscDiscoverGrid__cellValue"]
            log to console      ${\n}EventLog: devicename: zscaler-nss: = ${hits} , ${timestamp}
            # Click Element                       xpath:${REFRESH_FILTER_BTN}

User Should View Information Data EventLog By Click Button Expand EventLog LEEF
                Wait Until Element Is Visible       xpath:${INFORMATION_EVENTLOG_BTN}     ${TIMEOUT}
                Click Element                       xpath:${INFORMATION_EVENTLOG_BTN}     
                Wait Until Element Is Visible       xpath:${SEARCH_FILL_EXP_DOC}          ${TIMEOUT}  
                Click Element                       xpath:${SEARCH_FILL_EXP_DOC} 
                Press Keys                          None                        ${type_search_cef_information} 
                Run Keyword And Continue On Failure             Element Text Should Be              xpath:${VALUE_FILL_TXA}                     ${value_leef}
                Sleep                               3s
                Click Element                       xpath:${SEARCH_FILL_EXP_THX} 
                Sleep                               3s
                Press Keys                          None                                ESC
                Click Element                       xpath:${REFRESH_FILTER_BTN}

User Can Search Data EventLog On Search Field Names LEEF 
                FOR     ${data}    IN          @{leef_fillter}
                        Wait Until Element Is Visible       xpath:${SEARCH_FIELD_NAMES_BAR}    ${TIMEOUT}
                        Click Element                       xpath:${SEARCH_FIELD_NAMES_BAR}
                        Press Keys                          None                               ${data}
                        Click Element                       xpath://mark[text()[contains(.,"${data}")]]
                        Wait Until Element Is Visible       xpath:${ADD_FILTER_BTN}     ${TIMEOUT}
                        Click Element                       xpath:${ADD_FILTER_BTN}
                        Sleep                               5s
                        Wait Until Element Is Visible       xpath:${SEARCH_FIELD_NAMES_BAR}    ${TIMEOUT}
                        Click Element                       xpath:${SEARCH_FIELD_NAMES_BAR}
                        Press Keys                          None                        CTRL+a
                        Press Keys                          None                        BACKSPACE
                        Sleep                               3s
                END

User Can Verify Devicename On Field Grid View
                Wait Until Element Is Visible       xpath:${FILTER_TIME_BTN}      ${TIMEOUT}
                Click Element                       xpath:${FILTER_TIME_BTN}   
                Wait Until Element Is Visible       xpath:${FILTER_15MINUTES_BTN}      ${TIMEOUT}
                Click Element                       xpath:${FILTER_15MINUTES_BTN}   
                FOR     ${data}    IN          @{devicename_vrf}
                        Run Keyword And Continue On Failure            Element Text Should Be              xpath://mark[text()[contains(.,"${data}")]]                     ${data}
                        Sleep               3s
                        # ${Status}   Run Keyword And Return Status    User Can Verify EventID On Field Grid View   
                        # log to console      ${\n}${Status} <<<
                END

User Can Verify DataSteamDataset On Field Grid View
                FOR     ${data}    IN          @{datasteamset_vrf}
                        Run Keyword And Continue On Failure            Element Text Should Be              xpath://span[@class="dscDiscoverGrid__cellValue"][text()[contains(.,"${data}")]]                     ${data}
                        Sleep               3s
                        # ${Status}   Run Keyword And Return Status    User Can Verify EventID On Field Grid View   
                        # log to console      ${\n}${Status} <<<
                END

User Can Verify Tags LEEF On Field Grid View
                FOR     ${data}    IN          @{tagsleef_vrf}
                        Run Keyword And Continue On Failure            Element Text Should Be              xpath://span[@class="dscDiscoverGrid__cellValue"][text()[contains(.,"${data}")]]                     ${data}
                        Sleep               3s
                        # ${Status}   Run Keyword And Return Status    User Can Verify EventID On Field Grid View   
                        # log to console      ${\n}${Status} <<<
                END


User Can Verify Sort Time Data On Field Grid View
                # Wait Until Element Is Visible       xpath:${FILTER_TIME_BTN}      ${TIMEOUT}
                # Click Element                       xpath:${FILTER_TIME_BTN}   
                # Wait Until Element Is Visible       xpath:${FILTER_15MINUTES_BTN}      ${TIMEOUT}
                # Click Element                       xpath:${FILTER_15MINUTES_BTN}   
                Sleep                               3s
                ${timestamp}=        Get Text       xpath://span[@class="dscDiscoverGrid__cellValue"]
                log to console      ${\n}${timestamp} <<< Timestamp Befor Sort
                Wait Until Element Is Visible       xpath:${TIMESTAM_TXA}      ${TIMEOUT}
                Click Element                       xpath:${TIMESTAM_TXA}  
                Wait Until Element Is Visible       xpath:${SORT_OLD-NEW}      ${TIMEOUT}
                Click Element                       xpath:${SORT_OLD-NEW}
                Sleep                               5s
                ${timestamp}=        Get Text       xpath://span[@class="dscDiscoverGrid__cellValue"]
                log to console      ${\n}${timestamp} <<< Timestamp After Sort OLD-NEW
                Wait Until Element Is Visible       xpath:${TIMESTAM_TXA}      ${TIMEOUT}
                Click Element                       xpath:${TIMESTAM_TXA}  
                Wait Until Element Is Visible       xpath:${SORT_NEW-OLD}      ${TIMEOUT}
                Click Element                       xpath:${SORT_NEW-OLD}
                Sleep                               5s
                ${timestamp}=        Get Text       xpath://span[@class="dscDiscoverGrid__cellValue"]
                log to console      ${\n}${timestamp} <<< Timestamp After Revert Sort NEW-OLD



                
                
  

                 


            


