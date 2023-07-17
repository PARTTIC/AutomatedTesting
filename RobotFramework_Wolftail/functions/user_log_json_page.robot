*** Settings ***
Resource        ../resources/locator.robot

*** Keyword ***
Select Index Data Type Json EventLog
            Wait Until Element Is Visible       xpath:${MENU_INDEX_BTN}     ${TIMEOUT}
            Click Element                       xpath:${MENU_INDEX_BTN}
            Wait Until Element Is Visible       xpath:${MENU_INDEX_JSON_EVENTLOG}   ${TIMEOUT}
            Click Element                       xpath:${MENU_INDEX_JSON_EVENTLOG}

# User Can Search On Filter Bar By Computername EventLog Json
#             Wait Until Element Is Visible       xpath:${SEARCH_FILL_TXA}    ${TIMEOUT} 
#             Click Element                       xpath:${SEARCH_FILL_TXA}  
#             FOR     ${data}    IN          @{computername_json}
#                     Click Element                       xpath:${SEARCH_FILL_TXA} 
#                     Press Keys                          None                        ${data}
#                     Press Keys                          None                        ENTER
#                     # Select Filter Period
#                     Sleep                               3s
#                     Click Element                       xpath:${SEARCH_FILL_TXA}  
#                     Press Keys                          None                        CTRL+a
#                     Press Keys                          None                        BACKSPACE
#             END
#             # ${hits}=        Get Text                    xpath://div[@class="euiText eui-textTruncate css-1kntn8w-euiText-m"]
#             # log to console      ${\n}EventLogJson: = ${hits}
#             Click Element                       xpath:${REFRESH_FILTER_BTN}

User Can Search On Filter Bar By Computername Json
            FOR     ${data}    IN          @{computername_json}
                    Wait Until Element Is Visible       xpath:${SEARCH_FILL_TXA}    ${TIMEOUT} 
                    Click Element                       xpath:${SEARCH_FILL_TXA}  
                    Click Element                       xpath:${SEARCH_FILL_TXA} 
                    Press Keys                          None                        Computer:${data} 
                    Press Keys                          None                        ENTER
                    Sleep                               3s
                    Click Element                       xpath:${REFRESH_FILTER_BTN}
                    Wait Until Element Is Visible       xpath:${INFORMATION_EVENTLOG_BTN}     ${TIMEOUT}
                    Click Element                       xpath:${INFORMATION_EVENTLOG_BTN}     
                    Wait Until Element Is Visible       xpath:${SEARCH_FILL_EXP_DOC}          ${TIMEOUT}  
                    Click Element                       xpath:${SEARCH_FILL_EXP_DOC} 
                    Sleep                               3s
                    Press Keys                          None        ${type_search_balthazar_information}  
                    Run Keyword And Continue On Failure             Element Text Should Be              xpath:${VALUE_FILL_TXA}                     ${value_json}
                    Sleep                               3s
                    Click Element                       xpath:${SEARCH_FILL_EXP_THX} 
                    Press Keys                          None                                ESC
                    Sleep                               3s
                    Click Element                       xpath:${SEARCH_FILL_TXA}  
                    Press Keys                          None                        CTRL+a
                    Press Keys                          None                        BACKSPACE
                    Sleep                               3s
                    ${hits}=             Get Text                    xpath://div[@class="euiText eui-textTruncate css-1kntn8w-euiText-m"]
                    ${timestamp}=        Get Text       xpath://span[@class="dscDiscoverGrid__cellValue"]
                    log to console      ${\n}EventID:${data} = ${timestamp} , ${hits}
                    Click Element                       xpath:${REFRESH_FILTER_BTN}
            END

User Can Search Data EventLog On Search Field Names Json 
        Wait Until Element Is Visible       xpath:${SEARCH_FILL_TXA}    ${TIMEOUT} 
        Click Element                       xpath:${SEARCH_FILL_TXA}  
        Press Keys                          None                        Computer:TESTWT1000
        Press Keys                          None                        ENTER
        Sleep                               3s
                FOR     ${data}    IN          @{fillter.event_Json}
                        Wait Until Element Is Visible       xpath:${SEARCH_FIELD_NAMES_BAR}    ${TIMEOUT}
                        Click Element                       xpath:${SEARCH_FIELD_NAMES_BAR}
                        Press Keys                          None                               ${data}
                        Click Element                       xpath://mark[text()[contains(.,"${data}")]]
                        Sleep                               3s
                        Wait Until Element Is Visible       xpath:${ADD_FILTER_BTN}     ${TIMEOUT}
                        Click Element                       xpath:${ADD_FILTER_BTN}
                        Sleep                               5s
                        Wait Until Element Is Visible       xpath:${SEARCH_FIELD_NAMES_BAR}    ${TIMEOUT}
                        Click Element                       xpath:${SEARCH_FIELD_NAMES_BAR}
                        Press Keys                          None                        CTRL+a
                        Press Keys                          None                        BACKSPACE
                        Sleep                               3s
                END

User Can Search Data EventLog & Verify EventLog Parser Failure 
        Wait Until Element Is Visible       xpath:${SEARCH_FILL_TXA}    ${TIMEOUT} 
        Click Element                       xpath:${SEARCH_FILL_TXA}  
        Press Keys                          None                        CTRL+a
        Press Keys                          None                        BACKSPACE
        Sleep                               3s
        Press Keys                          None                        TESTWT1006
        Press Keys                          None                        ENTER
        Sleep                               3s
        Run Keyword And Continue On Failure            Element Text Should Be              xpath://span[@class="ffArray__highlight"][text()[contains(.,"${tags_json_failure}")]]        ${tags_json_failure}                    
        Sleep               3s
            
###############################################################
User Can Verify ComputerJson On Field Grid View
                FOR     ${data}    IN          @{comfuterjson_vrf}
                        Run Keyword And Continue On Failure            Element Text Should Be              xpath://mark[text()[contains(.,"${data}")]]                     ${data}
                        Sleep               3s
                        # ${Status}   Run Keyword And Return Status    User Can Verify EventID On Field Grid View   
                        # log to console      ${\n}${Status} <<<
                END

User Can Verify DomainJson On Field Grid View
                FOR     ${data}    IN          @{domainjson_vrf}
                        Run Keyword And Continue On Failure            Element Text Should Be              xpath://span[@class="dscDiscoverGrid__cellValue"][text()[contains(.,"${data}")]]                     ${data}
                        Sleep               3s
                        # ${Status}   Run Keyword And Return Status    User Can Verify EventID On Field Grid View   
                        # log to console      ${\n}${Status} <<<
                END

User Can Verify TagsJson On Field Grid View
                FOR     ${data}    IN          @{tagsjson_vrf}
                        Run Keyword And Continue On Failure            Element Text Should Be              xpath://span[@class="dscDiscoverGrid__cellValue"][text()[contains(.,"${data}")]]                     ${data}
                        Sleep               3s
                        # ${Status}   Run Keyword And Return Status    User Can Verify EventID On Field Grid View   
                        # log to console      ${\n}${Status} <<<
                END

