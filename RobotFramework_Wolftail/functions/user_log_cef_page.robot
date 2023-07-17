*** Settings ***
Resource        ../resources/locator.robot

*** Keyword ***
Select Index Data Type CEF EventLog
            Wait Until Element Is Visible       xpath:${MENU_INDEX_BTN}     ${TIMEOUT}
            Click Element                       xpath:${MENU_INDEX_BTN}
            Wait Until Element Is Visible       xpath:${MENU_INDEX_CEF_EVENTLOG}   ${TIMEOUT}
            Click Element                       xpath:${MENU_INDEX_CEF_EVENTLOG}

# User Can Search On Filter Bar By Information EventLog CEF
#         Wait Until Element Is Visible       xpath:${SEARCH_FILL_TXA}    ${TIMEOUT} 
#             Click Element                       xpath:${SEARCH_FILL_TXA}  
#             ${i}=   Set Variable    1
#             FOR     ${i}    IN RANGE    1   @{DATA_CEF_EVENTLOG#1}
#                     Click Element                       xpath:${SEARCH_FILL_TXA} 
#                     Press Keys                          None                        "@{DATA_CEF_EVENTLOG#1}"
#                     Press Keys                          None                        ENTER
#                     # Select Filter Period
#                     Sleep                               3s
#                     Click Element                       xpath:${SEARCH_FILL_TXA}  
#                     Press Keys                          None                        CTRL+a
#                     Press Keys                          None                        BACKSPACE
#                     Exit For Loop If                    "${i}" == "@{DATA_CEF_EVENTLOG#1}"
#             END
#             Click Element                       xpath:${REFRESH_FILTER_BTN}

User Can Search On Filter Bar By Information EventLog CEF
        Wait Until Element Is Visible       xpath:${FILTER_TIME_BTN}                ${TIMEOUT} 
        Click Element                       xpath:${FILTER_TIME_BTN} 
        Wait Until Element Is Visible       xpath:${FILTER_15MINUTES_BTN}           ${TIMEOUT} 
        Click Element                       xpath:${FILTER_15MINUTES_BTN} 
        Wait Until Element Is Visible       xpath:${SEARCH_FILL_TXA}    ${TIMEOUT} 
        Click Element                       xpath:${SEARCH_FILL_TXA}  
        #     ${name}=   Create list    bitdefender     TROJAN_Zemot
        #     ${i}=   Set Variable    0
            FOR     ${item}    IN          @{DATA_CEF_EVENTLOG#1}
                    Click Element                       xpath:${SEARCH_FILL_TXA} 
                    Press Keys                          None                        ${item}
                    Sleep                               3s
                    Press Keys                          None                        ENTER
                    # Select Filter Period
                    Sleep                               3s
                    Run Keyword And Continue On Failure             Wait Until Element Is Visible       xpath:${AMOUNT_EVENTLOG_CEF}             ${TIMEOUT}
                    Run Keyword And Continue On Failure             Element Text Should Be              xpath:${AMOUNT_EVENTLOG_CEF}            ${amount_eventLog} 
                    Sleep                               3s
                    Click Element                       xpath:${SEARCH_FILL_TXA}  
                    Sleep                               3s
                    Press Keys                          None                        CTRL+a
                    Press Keys                          None                        BACKSPACE
                #     Exit For Loop If                    "${i}" == "@{DATA_CEF_EVENTLOG#1}"
            END
        #     User Should View Information Data EventLog By Click Button Expand EventLog CEF
            Click Element                       xpath:${REFRESH_FILTER_BTN}

User Should View Information Data EventLog By Click Button Expand EventLog CEF
                Wait Until Element Is Visible       xpath:${INFORMATION_EVENTLOG_BTN}     ${TIMEOUT}
                Click Element                       xpath:${INFORMATION_EVENTLOG_BTN}     
                Wait Until Element Is Visible       xpath:${SEARCH_FILL_EXP_DOC}          ${TIMEOUT}  
                Click Element                       xpath:${SEARCH_FILL_EXP_DOC} 
                Press Keys                          None                        ${type_search_cef_information} 
                Run Keyword And Continue On Failure             Element Text Should Be              xpath:${VALUE_FILL_TXA}                     ${value_cef}
                Sleep                               3s
                Press Keys                          None                                ESC
                Click Element                       xpath:${REFRESH_FILTER_BTN}

User Can Search Data EventLog On Search Field Names 
                # Wait Until Element Is Visible       xpath:${SEARCH_FIELD_NAMES_BAR}    ${TIMEOUT}
                # Click Element                       xpath:${SEARCH_FIELD_NAMES_BAR}
                # Press Keys                          None                               ${event.code_fillter}
                # Sleep                               3s
                FOR     ${data}    IN          @{event.code_fillter}
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

User Can Verify Tags On Field Grid View CEF
                FOR     ${data}    IN          @{eventtags_cef_vrf}
                        Run Keyword And Continue On Failure            Element Text Should Be              xpath://span[@class="dscDiscoverGrid__cellValue"][text()[contains(.,"${data}")]]                     ${data}
                        Sleep               3s
                        # ${Status}   Run Keyword And Return Status    User Can Verify EventID On Field Grid View   
                        # log to console      ${\n}${Status} <<<
                END

User Can Verify DataSteam.Dataset On Field Grid View CEF
                FOR     ${data}    IN          @{datasteam_cef_vrf}
                        Run Keyword And Continue On Failure            Element Text Should Be              xpath://span[@class="dscDiscoverGrid__cellValue"][text()[contains(.,"${data}")]]                     ${data}
                        Sleep               3s
                        # ${Status}   Run Keyword And Return Status    User Can Verify EventID On Field Grid View   
                        # log to console      ${\n}${Status} <<<
                END



############################################################


  
                




            


