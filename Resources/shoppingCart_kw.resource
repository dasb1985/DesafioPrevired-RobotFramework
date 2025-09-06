*** Settings ***
Resource   ..//Resources//shoppingCart_po.resource
Library    SeleniumLibrary
Library    DateTime

*** Keywords ***

Search product: ${name_product} for add to cart
    Input Text    ${search_input}    ${name_product}
    Click Button    ${search_btn}
    Click Button    ${addToCart_btn}
    Capture Page Screenshot    screenshot-${name_product}-{index}.png
    Sleep  2s
    #Successufully alert is displayed
    ${alert_text}=   Get Text    ${alert_text_locator}
    Log    ${alert_text}
    Should Contain  ${alert_text}    ${name_product}    ignore_case=True


Validate Cart Contains Items
    [Arguments]    @{expected_products}
    ${cart_text}=    Get Text    xpath=//div[@id="cart"]//ul
    FOR    ${product}    IN    @{expected_products}
        Should Contain    ${cart_text}    ${product}     ignore_case=True
        Log    ${cart_text}
    END

Deploy cartMenu and validate items
    Click Button    ${displayCart_btn}
    Validate Cart Contains Items    Ipod Classic   iMac
    Capture Page Screenshot     screenshot-itemsOnCart-{index}.png  
    Sleep  2s

    

Go to checkout page
    Sleep   2s
    Click Element   ${checkout_menu_btn}

    ${checkoutTitle_txt}=    Get Title
    Should Be Equal    ${checkoutTitle_txt}    ${checkout_txt}


Pick item ${name_product} and added ${X} times
    Input Text    ${search_input}    ${name_product}
    Click Button    ${search_btn}
    Sleep  2s
    Scroll Element Into View        ${addToCart_btn}
    Click Image        xpath=//*[@id="content"]/div[3]/div/div/div[1]/a/img

    Sleep  2s
    Capture Page Screenshot    screenshot-${name_product}-{index}.png
    Check specification
    Pick Delivery Date


Check specification
    Click Element    xpath=//*[@id="content"]/div/div[1]/ul[2]/li[2]/a
    ${specificationText}=    Get Text    xpath=//*[@id="tab-specification"]/table/tbody[1]
    Should Contain    ${specificationText}    item=16GB

Pick Delivery Date
    ${varDate}=    Get Current Date
    ${dateToDeliver}=    Add Time To Date    ${varDate}    1 day   date_format=YYYY-MM-DD
    
    Input Text    id=input-option225    ${dateToDeliver}
    Input Text    id=input-quantity    2
    Click Button    id=button-cart