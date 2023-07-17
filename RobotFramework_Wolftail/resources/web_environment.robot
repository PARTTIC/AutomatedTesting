*** Variable ***
${TIMEOUT}                                             30s
${DELAY}                                               10s

#ELK LOGIN PAGE
${USERNAME_INPUT}                                     //input[@name="username"]
${PASSWORD_INPUT}                                     //input[@name="password"] 
${LOGIN_BTN}                                          //button[@type="submit"]

#DISCOVER PAGE
${MENU_BTN}                                           //button[@aria-label="Toggle primary navigation"]
${MENU_DISCOVER_TXT}                                  //span[@title="Discover"]
${MENU_TENANT_MANAGE_TXT}                             //span[@title="Tenant Management"]
${SEARCH_FILL_TXA}                                    //div[@role="search"]
${WELCOME_TXA}                                        //h1[@class="euiTitle css-j62gx3-euiTitle-l"][contains(.,"Welcome home")] 
${MENU_INDEX_BTN}                                     //button[@data-test-subj="discover-dataView-switch-link"]

#INDEX INFORMATION
${MENU_INDEX_CEF_EVENTLOG}                            //span[text()[contains(.,"Logs-cef-rv-dats")]] 
${MENU_INDEX_BALTHAZAR_EVENTLOG}                      //span[text()[contains(.,"Logs-balthazar-rv-dats")]] 
${MENU_INDEX_JSON_EVENTLOG}                           //span[text()[contains(.,"Logs-json-rv-dats")]] 
${MENU_INDEX_LEEF_EVENTLOG}                           //span[text()[contains(.,"Logs-leef-rv-dats")]] 

${FILTER_TIME_BTN}                                    //span[@class="euiButtonContent euiButtonContent--iconRight euiButtonEmpty__content"]
${FILTER_TODAY_BTN}                                   //button[text()[contains(.,"Today")]]
${FILTER_15MINUTES_BTN}                               //button[text()[contains(.,"Last 15 minutes")]]

${SEARCH_FIELD_NAMES_BAR}                             //input[@placeholder="Search field names"]

${REFRESH_FILTER_BTN}                                 //button[@aria-label="Refresh query"]

${META_FIELD_TXF}                                     //strong[text()[contains(.,"Meta fields")]]

${SCORE_TXF}                                          //span[text()[contains(.,"_score")]]

${INDEX_TXF}                                          //span[text()[contains(.,"_index")]]

${ID_TXF}                                             //span[text()[contains(.,"_id")]]

${ADD_FILTER_BTN}                                     //button[@aria-label="Add field as column"]

${ADVANCED_BTN}                                       //button[@id="details-button"]

${IP_LINK_TXF}                                        //a[@id="proceed-link"]

#VERIFY DATA EVENTLOG
${DOCUMENT_TXA}                                       //div[@title="Document"]
${NO_RESULT_TXA}                                      //h2[@data-test-subj="discoverNoResults"]

${INFORMATION_EVENTLOG_BTN}                           //button[@data-test-subj="docTableExpandToggleColumn"]

# ${AMOUNT_EVENTLOG_CEF}                               //strong[@data-test-subj="unifiedHistogramQueryHits"][text()[contains(.,${amount_eventLog} )]]
${AMOUNT_EVENTLOG_CEF}                               //strong[@data-test-subj="unifiedHistogramQueryHits"]
${SEARCH_FILL_EXP_DOC}                               //input[@class="euiFieldSearch euiFieldSearch--fullWidth"]
${SEARCH_FILL_EXP_THX}                               /html/body/div[6]/div[2]/div/div[2]/div/div/div/div/div[2]/div/div[2]/div/div/div[2]/button
${VALUE_FILL_TXA}                                    //div[@class="kbnDocViewer__value"]

${FILL_TEXT_CEF}                                     //span[text()[contains(.,"event.code")]]

${EVENTID_TXF}                                       //mark[text()[contains(.,"4624")]]
${EVENTNAME_TXF}                                     //span[@class="dscDiscoverGrid__cellValue"][text()[contains(.,"An account was successfully logged on")]]
${TAGS_TXF}                                          //span[@class="dscDiscoverGrid__cellValue"][text()[contains(.,"decoded")]]

${TIMESTAM_TXA}                                      //span[@class="euiToolTipAnchor css-jcaat8-euiToolTipAnchor-inlineBlock"][text()[contains(.,"@timestamp")]]
${SORT_OLD-NEW}                                      //span[@class="euiListGroupItem__label css-nlq75h-euiListGroupItem__label-truncate"][text()[contains(.,"Old-New")]]
${SORT_NEW-OLD}                                      //span[@class="euiListGroupItem__label css-nlq75h-euiListGroupItem__label-truncate"][text()[contains(.,"New-Old")]]

# data_stream.dataset: cef

#Tenant Management 
${TENANT_MANAGEMENT_TXA}                             //h1[text()[contains(.,"Tenant Management")]] 
# ${CREATE_TENANT_TXA}                                 //button[@aria-label="create tenant"]
${CREATE_TENANT_TXA}                                 //button[@aria-label="Next"]
${TENANT_ID_TXF}                                     //input[@placeholder="Tenant ID"]
${TENANT_ID_TXF_VRY}                                 //input[@placeholder="Tenant ID"][@value='']
${TENANT_NAME_TXF}                                   //input[@placeholder="Tenant Name"]
${TENANT_NAME_TXF_VRY}                               //input[@placeholder="Tenant Name"][@value='']
${TENANT_SHORT_NAME_TXF}                             //input[@placeholder="Short Name"]
${TENANT_SHORT_NAME_TXF_VRY}                         //input[@placeholder="Short Name"][@value=""]
${TENANT_DESCRIPTION_TXF}                            //textarea[@placeholder="Description"]    
${TENANT_DESCRIPTION_VRY}                            //textarea[@placeholder="Description"][contains(.,"")]                     
# ${CREATE_NEW_TENANT_BTN}                             //div[@class="euiText css-jp60ox-euiText-m-euiTextColor-customColor"]
${CREATE_NEW_TENANT_BTN}                             //span[@class="eui-textTruncate"]
${EDIT_BTN}                                          //button[@aria-label="Edit"]
${DELETE_BTN}                                        //button[@aria-label="delete"]
${DIALOG_DELETE_TENANT_CNF}                          //div[@class="euiText css-d0w825-euiText-m"]//p[text()[contains(.,"Do you want to delete  tenant ?")]] 
${DIALOG_DELETE_TENANT_CNF_1}                        //div[@class="euiText css-d0w825-euiText-m"]//h3[text()[contains(.,"Delete Tenant")]] 
${DELETE_TENANT_CNF_BTN}                             //span[@class="css-1km4ln8-euiButtonDisplayContent"]//span[text()[contains(.,"Delete")]] 
${VERIFY_TENANTID_DUPLICATED_TXA}                    //div[@aria-live="polite"][contains(.,"Tenant ID has been Duplicated.")]
${VERIFY_TENANTNAME_DUPLICATED_TXA}                  //div[@aria-live="polite"][contains(.,"Tenant Name has been Duplicated.")]
${VERIFY_TENANTSHORT_DUPLICATED_TXA}                 //div[@aria-live="polite"][contains(.,"Short Name has been Duplicated.")]
${CLOSE_TENANT_CREATE_BTN}                           /html/body/div[4]/div[2]/div/div[2]/div/div[1]/div/div[2]/button

#Log Source Group Management 
${LOG_SOURCE_GROUP_TXA}                             //span[@title="Log Source Group Management"]
${LOG_SOURCE_GROUP_TXT}                             //h1[text()[contains(.,"Log Source Group Management")]]
${CREATE_LOG_SOURCE_GROUP_BTN}                      //button[@aria-label="create log source group"]   
${LOG_SOURCE_GROUP_NAME_TXF}                        //input[@placeholder="Log Source Group Name"]       
${LOG_SOURCE_GROUP_DESCRIPTION_TXF}                 //textarea[@placeholder="Description"]
${LOG_SOURCE_GROUP_NEW_CREATE_BTN}                  //span[@class="eui-textTruncate"] 
${LOG_SOURCE_GROUP_FUNCITON_BTN}                    //button[@class="euiButtonIcon euiButtonIcon--xSmall logSourceGroup-menu css-1q7ycil-euiButtonIcon-empty-primary-hoverStyles"]
${DELETE_LOG_SOURCE_GROUP_BTN}                      //span[@class="euiContextMenuItem__text"][text()[contains(.,"Delete")]]
${CONF_DELETE_LOG_SOURCE_GROUP}                     //button[@data-test-subj="confirmModalConfirmButton"]
${LOG_SOURCE_GROUP_NAME_VRF}                        //div[@aria-live="polite"][contains(.,"Log Source Group Name has been Duplicated.")]
${CREATE_LOG_SOURCE_GROUP_FAIL_NTF}                 //span[contains(.,"Create Log Source Group Failed")]
${CLOSE_CREATE_LOG_SOURCE_GROUP}                    /html/body/div[4]/div[2]/div/div[2]/div/div[1]/div/div[2]/button
${EDIT_LOG_SOURCE_GROUP_BTN}                        //span[@class="euiContextMenuItem__text"][text()[contains(.,"Edit")]]
${DATA_LOG_SOURCE_GROUP_NO_ITEM}                    //span[contains(.,"No items found")]
${NOTIFY_DELETE_LOG_SOURCE_GROUP}                   //span[text()[contains(.,"Delete Log Source Group Failed")]]