*** Settings ***
Resource        ../../resources/locator.robot
Suite Teardown   Sleep       10s
	
*** Test case ***    
Scenario_Manage_Tenant_Wolftail   
        Given Open Chrome Browser Login Should Pass
        When User Can Login With Account "dev" and Password "P@ssw0rd"
        Then User Should Found Wolftail Page
Verify User Can Select Menu Tenant Management Page
        When User Goto Tenant Management Page
        And User Can Verify Information On Tenant Management Page
Verify User Can Create Tenant 
        And User Can Create Tenant On Tenant Management Page
        And User Can Verify TextFill On Create Tenant Page
        And User Can Input Information Tenant
Verify User Can Delete Tenant After Create
        And User Can Delete Tenant After Create On Tenant Management Page
        And User Can Verify Dialog Confirm Delete Tenant On Tenant Management Page
Verify User When Create Tenant Duplicate
        And User Can Verify Create Tenant Duplicate On Tenant Management Page
        And User Can Verify After Input Data Create Tenant Duplicated On Tenant Management Page
Verify User Can Edit Information Tenant 
        And User Can Edit Data Tenant After Create On Tenant Management Page




                


