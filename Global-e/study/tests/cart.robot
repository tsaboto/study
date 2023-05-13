*Settings*

Documentation  This test will validate a simple cenario to buy one item 
Resource    ${EXECDIR}/resources/base.robot
Test Setup    Start Session
Test Teardown    Finish Session    

*** Test Cases ***

# Given I open the website
Buy one item
    Home page is visible
    Select item        bike
    Insert Item On Cart  
    Validate the insertion in the cart    Added to Cart
    Check item on the cart     

# And I select one item
    
# When Put in the cart
# Then I can see the item in the cart

