*** Settings ***
Library         library/SeleniumELibrary.py
Library         String
Library         Screenshot
# Library         SeleniumELibrary

#+----------------------------------------------------------------+
#| Login Page                                                     |
#+----------------------------------------------------------------+
Resource    ../functions/user_login_page.robot
#+----------------------------------------------------------------+
#| Discover Page                                                  |
#+----------------------------------------------------------------+
Resource    ../functions/user_discover_page.robot
Resource    ../functions/user_log_cef_page.robot
Resource    ../functions/user_log_leef_page.robot
Resource    ../functions/user_log_balthazar_page.robot
Resource    ../functions/user_log_json_page.robot
Resource    ../functions/user_manage_tenant_page.robot
Resource    ../functions/user_manage_log_source_group.robot
#+----------------------------------------------------------------+
#| Xpath Environments                                             |
#+----------------------------------------------------------------+
Resource        web_environment.robot
Resource        data.robot
Resource        ../executions/scenario_cef_eventlog/data_cef.robot
Resource        ../executions/scenario_balthazar_eventlog/data_balthazar.robot
Resource        ../executions/scenario_leef_eventlog/data_leef.robot
Resource        ../executions/scenario_json_eventlog/data_json.robot
Resource        ../executions/scenario_manage_tenant/data_manage_tenant.robot
Resource        ../executions/scenario_log_source_group/data_manage_log_source_group.robot