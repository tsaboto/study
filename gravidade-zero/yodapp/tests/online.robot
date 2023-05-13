*Settings*
Documentation    Suite de teste para verificar se o app esta online

Resource        ${EXECDIR}/resources/base.robot

Test Setup       Start Session
Test Teardown    End Session

*Test Cases*
Yodapp must be online

    Get Title       equal           Yodapp | QAninja


Should exist a Welcome message

    Wait For Elements State
    ...             css=.navbar-item >> text=Que a Força (qualidade) esteja com você!
    ...             visible     5
 