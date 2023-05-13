*Settings*

Documentation    Actions implementation

*Keywords*

Home page is visible
    Wait For Elements State    xpath=//*[@id = "nav-logo-sprites"]    visible    5

Select item
    [Arguments]   ${item}

    Fill text        //*[@type= "text"]     ${item}
    Click            xpath=//span[@id= "nav-search-submit-text"]
    # Keyboard Key    press    Enter

Insert Item On Cart
    ${css_item}    Set Variable    (//a[@class= "a-link-normal s-underline-text s-underline-link-text s-link-style a-text-normal"])[1]
    Click          xpath=${css_item}
    # Click          id=add-to-cart-button
    Click          xpath=//input[@name= "submit.add-to-cart"]

Validate the insertion in the cart
    [Arguments]    ${text_validation}

    Wait For Elements State    xpath= //span[@class= "a-size-medium-plus a-color-base sw-atc-text a-text-bold"] >> text="${text_validation}"
    ${texto}    Get Text       xpath=//span[@id= "nav-cart-count"]
    Should Contain    ${texto}    1
    
Check item on the cart
    Click     xpath=//span[@class= "nav-cart-icon nav-sprite"]
    Wait For Elements State    xpath=//div[@class= "a-row sc-cart-header sc-compact-bottom"]
    
    ${texto}    Get Text    xpath=//h1
    Should Contain      ${texto}      Shopping Cart

    ${texto_price}    Get Text    xpath=//span[@class= "a-size-medium a-color-base sc-price sc-white-space-nowrap sc-product-price a-text-bold"]
    Should Contain      ${texto_price}         $299.99