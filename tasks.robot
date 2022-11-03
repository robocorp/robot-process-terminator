*** Settings ***
Library     RPA.Robocorp.WorkItems

*** Tasks ***
Terminate Workitems
    [Documentation]    Cycle through work items.
    For Each Input Work Item    Terminate Workitem

*** Keywords ***
Terminate Workitem
    TRY
        Release Input Work Item    DONE
    EXCEPT    AS    ${err}
        Log    ${err}    level=ERROR
        Release Input Work Item
        ...    state=FAILED
        ...    exception_type=APPLICATION
        ...    code=UNCAUGHT_ERROR
        ...    message=${err}
    END
