*** Settings ***
Resource        ../resources/locator.robot
Suite Teardown   Sleep       600s
	
*** Test case ***    
Scenario_POC_Wolftail   
        Given Open Chrome Browser Login Should Pass
        When User Can Login With Account "dev" and Password "P@ssw0rd"
        Then User Should Found Wolftail Page
        When User Goto Discover Page
        And Select Index Data Type CEF EventLog
        And User Can Select Filter Period Time
        And User Can Search On Filter Bar By Computername
        Then User Should Found Information Data EventLog
        And User Can Search On Filter Bar By EventID
        Then User Should Found Information Data EventLog
        And User Can Search On Filter Bar By Kibana Query Language
        When User Search EventLog On Filter Bar By False Data
        Then User Should Not Found Information Data EventLog 
        When User Search EventLog Type CEF
        And User Should Found EventLog 
        And User Should View Information Data EventLog By Click Button Expand EventLog
        And User Can Verify EventID On Field Grid View


        # Goto Discover Page
        # Select Filter Period
        # Search Fill Textarea
        # Select Filter On Meta Fields 
        # Search Fill Textarea




                


