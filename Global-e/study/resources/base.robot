*Settings*

Documentation    Base information to test

Library        Browser    timeout=30s    

Resource       actions.robot

*Variable*
${BASE_URL}        https://amazon.com

*Keywords*

Start Session
    New Browser    chromium     false    slowMo=00:00:00
    New Page        ${BASE_URL} 
    Set Viewport Size     1024    768 

Finish Session
    Take Screenshot    fullPage=True