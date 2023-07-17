*** Settings ***
Resource        ../../resources/locator.robot
Suite Teardown   Sleep       15s
	
*** Test case ***    
Scenario_BALTHAZAR_Wolftail   
        Given Open Chrome Browser Login Should Pass
        When User Can Login With Account "dev" and Password "P@ssw0rd"
        Then User Should Found Wolftail Page
Verify User Can Select Menu Discover And Select Index Data Type Balthazar
        When User Goto Discover Page
        And Select Index Data Type Balthazar EventLog
Vefify User Can Select Filter Period Time 
        And User Can Select Filter Period Time
Vefify User Can Search On Filter By Computername "RVCSWLT038.rvconnex.com&RVCSWLT037.rvconnex.com"
        And User Can Search On Filter Bar By Computername EventLog Balthazar
        Then User Should Found Information Data EventLog
Vefify User Can Search On Filter By EventID "4624 4625 4656"
        And User Can Search On Filter Bar By EventID
Vefify User Can Search On Filter By Kibana Query Language Balthazar
        And User Can Search On Filter Bar By Kibana Query Language Balthazar
        And User Can Search Data EventLog On Search Field Names Balthazar 
Vefify User Can See EventID On Field Grid View
        And User Can Verify EventID On Field Grid View
Vefify User Can See EventName On Field Grid View
        And User Can Verify EventName On Field Grid View
Vefify User Can See Data Tags On Field Grid View
        And User Can Verify Tags On Field Grid View
Vefify User Can Sort Time Data On Field Grid View 
        Then User Can Verify Sort Time Data On Field Grid View
        
        
        # When User Search EventLog On Filter Bar By False Data
        # Then User Should Not Found Information Data EventLog 
        # And User Can Search Data EventLog On Search Field Names Balthazar 





                


