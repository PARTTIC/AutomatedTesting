*** Settings ***
Resource        ../../resources/locator.robot
Suite Teardown   Sleep       10s
	
*** Test case ***    
Scenario_CEF_Wolftail   
        Given Open Chrome Browser Login Should Pass
        When User Can Login With Account "dev" and Password "P@ssw0rd"
        Then User Should Found Wolftail Page
        When User Goto Discover Page
        And Select Index Data Type CEF EventLog
        And User Can Select Filter Period Time
        And User Can Search On Filter Bar By Information EventLog CEF
        And User Should View Information Data EventLog By Click Button Expand EventLog CEF
        And User Can Search Data EventLog On Search Field Names
        And User Can Verify DataSteam.Dataset On Field Grid View CEF
        And User Can Verify Tags On Field Grid View CEF
        Then User Can Verify Sort Time Data On Field Grid View

        # Then User Should Found Information Data EventLog
        # And User Can Search On Filter Bar By EventID
        # Then User Should Found Information Data EventLog
        # And User Can Search On Filter Bar By Kibana Query Language
        # When User Search EventLog On Filter Bar By False Data
        # Then User Should Not Found Information Data EventLog 
        # When User Search EventLog Type CEF
        # And User Should Found EventLog 
        # And User Should View Information Data EventLog By Click Button Expand EventLog


        # Goto Discover Page
        # Select Filter Period
        # Search Fill Textarea
        # Select Filter On Meta Fields 
        # Search Fill Textarea




                


