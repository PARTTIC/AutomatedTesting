*** Settings ***
Resource        ../resources/locator.robot

*** Keyword ***
User Goto Discover Page
            Wait Until Element Is Visible       xpath:${MENU_BTN}           ${TIMEOUT}
            Click Element                       xpath:${MENU_BTN}
            Wait Until Element Is Visible       xpath:${MENU_DISCOVER_TXT}  ${TIMEOUT}
            Click Element                       xpath:${MENU_DISCOVER_TXT}

# Select Index Data Type
#             Wait Until Element Is Visible       xpath:${MENU_INDEX_BTN}     ${TIMEOUT}
#             Click Element                       xpath:${MENU_INDEX_BTN}
#             Wait Until Element Is Visible       xpath:${MENU_INDEX_AGENT}   ${TIMEOUT}
#             Click Element                       xpath:${MENU_INDEX_AGENT}

User Can Search On Filter Bar By Computername
        Wait Until Element Is Visible       xpath:${SEARCH_FILL_TXA}    ${TIMEOUT} 
            Click Element                       xpath:${SEARCH_FILL_TXA}  
            ${i}=   Set Variable    1
            FOR     ${i}    IN RANGE    1   5
                    Click Element                       xpath:${SEARCH_FILL_TXA} 
                    Press Keys                          None                        "RVCSWLTTESTSE100${i}"
                    Press Keys                          None                        ENTER
                    # Select Filter Period
                    Sleep                               3s
                    Click Element                       xpath:${SEARCH_FILL_TXA}  
                    Press Keys                          None                        CTRL+a
                    Press Keys                          None                        BACKSPACE
                    Exit For Loop If                    "${i}" == "5"
            END
            Click Element                       xpath:${REFRESH_FILTER_BTN}

# User Can Search On Filter Bar By Kibana Query Language
#         Wait Until Element Is Visible       xpath:${SEARCH_FILL_TXA}    ${TIMEOUT} 
#         Click Element                       xpath:${SEARCH_FILL_TXA}  
#         Press Keys                          None                        CTRL+a
#         Press Keys                          None                        BACKSPACE
#             ${i}=   Set Variable    1
#             FOR     ${i}    IN RANGE    1   5
#                     Click Element                       xpath:${SEARCH_FILL_TXA} 
#                     Press Keys                          None                        RVCSWLTTESTSE100${i} AND 4624 and RVCONNEX
#                     Press Keys                          None                        ENTER
#                     # Select Filter Period
#                     Sleep                               3s
#                     Click Element                       xpath:${SEARCH_FILL_TXA}  
#                     Press Keys                          None                        CTRL+a
#                     Press Keys                          None                        BACKSPACE
#                     Exit For Loop If                    "${i}" == "5"
#             END
#             Click Element                       xpath:${REFRESH_FILTER_BTN}

# And User Can Search On Filter Bar By EventID
#                 Wait Until Element Is Visible       xpath:${SEARCH_FILL_TXA}    ${TIMEOUT} 
#                 Click Element                       xpath:${SEARCH_FILL_TXA}  
#                 Click Element                       xpath:${SEARCH_FILL_TXA} 
#                 Press Keys                          None                        "4624"
#                 Press Keys                          None                        ENTER

User Search EventLog On Filter Bar By False Data
                Click Element                       xpath:${SEARCH_FILL_TXA} 
                Press Keys                          None                        "THIS FALSE DATA"
                Press Keys                          None                        ENTER
                Sleep                               3s
                Click Element                       xpath:${SEARCH_FILL_TXA} 

User Should Not Found Information Data EventLog 
                Wait Until Element Is Visible       xpath:${NO_RESULT_TXA}      ${TIMEOUT} 
                Element Text Should Be              xpath:${NO_RESULT_TXA}      No results match your search criteria
                Press Keys                          None                        CTRL+a
                Press Keys                          None                        BACKSPACE

User Search EventLog Type CEF
                Press Keys                          None                        data_stream.dataset: cef
                Press Keys                          None                        ENTER

User Should Found EventLog 
                Wait Until Element Is Visible       xpath:${DOCUMENT_TXA}      ${TIMEOUT} 
                Element Text Should Be              xpath:${DOCUMENT_TXA}      Document

# User Should View Information Data EventLog By Click Button Expand EventLog
#                 Wait Until Element Is Visible       xpath:${INFORMATION_EVENTLOG_BTN}     ${TIMEOUT}
#                 Click Element                       xpath:${INFORMATION_EVENTLOG_BTN}            

# Search Fill Textarea
#             Wait Until Element Is Visible       xpath:${SEARCH_FILL_TXA}    ${TIMEOUT} 
#             Click Element                       xpath:${SEARCH_FILL_TXA}  
#             ${i}=   Set Variable    1
#             FOR     ${i}    IN RANGE    1   6
#                     Click Element                       xpath:${SEARCH_FILL_TXA} 
#                     Press Keys                          None                        "RVCSWLTTESTSE100${i}"
#                     Press Keys                          None                        ENTER
#                     # Select Filter Period
#                     Sleep                               3s
#                     Click Element                       xpath:${SEARCH_FILL_TXA}  
#                     Press Keys                          None                        CTRL+a
#                     Press Keys                          None                        BACKSPACE
#                     Exit For Loop If                    "${i}" == "6"
#             END
#             Click Element                       xpath:${REFRESH_FILTER_BTN}

User Can Select Filter Period Time
            Wait Until Element Is Visible       xpath:${FILTER_TIME_BTN}    ${TIMEOUT} 
            Click Element                       xpath:${FILTER_TIME_BTN}  
            Wait Until Element Is Visible       xpath:${FILTER_TODAY_BTN}   ${TIMEOUT} 
            Click Element                       xpath:${FILTER_TODAY_BTN} 

User Should Found Information Data EventLog
            Wait Until Element Is Visible       xpath:${DOCUMENT_TXA}      ${TIMEOUT} 
            Element Text Should Be              xpath:${DOCUMENT_TXA}      Document

Select Filter On Meta Fields 
            Wait Until Element Is Visible       xpath:${META_FIELD_TXF}     ${TIMEOUT} 
            Click Element                       xpath:${META_FIELD_TXF} 
            Wait Until Element Is Visible       xpath:${SCORE_TXF}          ${TIMEOUT} 
            Click Element                       xpath:${SCORE_TXF} 
            Wait Until Element Is Visible       xpath:${ADD_FILTER_BTN}     ${TIMEOUT}
            Click Element                       xpath:${ADD_FILTER_BTN}
            Wait Until Element Is Visible       xpath:${INDEX_TXF}          ${TIMEOUT} 
            Click Element                       xpath:${INDEX_TXF} 
            Wait Until Element Is Visible       xpath:${ADD_FILTER_BTN}     ${TIMEOUT}
            Click Element                       xpath:${ADD_FILTER_BTN}
            Wait Until Element Is Visible       xpath:${ID_TXF}             ${TIMEOUT} 
            Click Element                       xpath:${ID_TXF} 
            Wait Until Element Is Visible       xpath:${ADD_FILTER_BTN}     ${TIMEOUT}
            Click Element                       xpath:${ADD_FILTER_BTN}

# Open Chrome Browser Should Pass2
#                 Open Browser    ${TESTCLICK_}       ${browser}
#                 Maximize Browser Window

# Switch Tabs To Login As Player Leader Should Pass       
#                 Execute Javascript    window.open('${P_SITE}')
#                 ${tabs}=    Get Window Handles   
#                 Select Window   ${tabs}[1] 

# Player Leader Login Should Pass
#                 [Arguments]         ${LeaderUsername}       ${LeaderPassword}
#                 Wait Until Element Is Visible   xpath:${PLAYER_USERNAME_INPUT}          ${TIMEOUT}   
#                 Set Focus To Element            xpath:${PLAYER_USERNAME_INPUT}  
#                 Sleep                           5s
#                 Input Text                      xpath:${PLAYER_USERNAME_INPUT}          ${LeaderUsername}
#                 Input Password                  xpath:${PLAYER_PASSWORD_INPUT}          ${LeaderPassword}
#                 Click Element                   xpath:${PLAYER_SIGNIN_BTN}

# Player Login Should Pass
#                 [Arguments]     ${credential}       ${secret} 
#                 # Sleep                                                               10s
#                 # Reload Page
#                 Sleep                                                               10s
#                 Wait Until Element Is Visible   xpath:${PLAYER_USERNAME_INPUT}      30s
#                 Click Element                   xpath:${PLAYER_USERNAME_INPUT} 
#                 Input Text                      xpath:${PLAYER_USERNAME_INPUT}      ${credential}
#                 Set Focus To Element            xpath:${PLAYER_PASSWORD_INPUT} 
#                 Input Password                  xpath:${PLAYER_PASSWORD_INPUT}      ${secret}
#                 Click Element                   xpath:${PLAYER_SIGNIN_BTN}    


# Player Login But Fail 
#                 [Arguments]     ${credential}       ${secret} 
#                 Sleep                                                               10s
#                 Reload Page
#                 Sleep                                                               10s
#                 Wait Until Element Is Visible   xpath:${PLAYER_USERNAME_INPUT}      30s
#                 Click Element                   xpath:${PLAYER_USERNAME_INPUT} 
#                 Input Text                      xpath:${PLAYER_USERNAME_INPUT}       ${credential}
#                 Set Focus To Element            xpath:${PLAYER_PASSWORD_INPUT} 
#                 Input Password                  xpath:${PLAYER_PASSWORD_INPUT}   ${secret}
#                 Click Element                   xpath:${PLAYER_SIGNIN_BTN}




            


