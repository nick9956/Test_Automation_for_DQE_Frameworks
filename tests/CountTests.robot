*** Settings ***
Library           ../libraries/DatabaseLibrary.py
Library           String
Suite Setup       Connect To Database
Suite Teardown    Disconnect From Database
Test Template     Check Table Count

*** Variables ***
${DB_QUERY_COUNT}    SELECT COUNT(%COLUMN_NAME%) FROM hr.%TABLE_NAME%

*** Test Cases ***                 COLUMN_NAME    TABLE_NAME    EXPECTED_COUNT
Check Count in Countries Column    country_name   countries     25
Check Count in Employees Column    employee_id    employees     40
Check Count in Locations Column    postal_code    locations     6

*** Keywords ***
Check Table Count
    [Arguments]  ${column_name}     ${table_name}    ${expected_count}
    ${query}=    Replace String    ${DB_QUERY_COUNT}    %COLUMN_NAME%    ${column_name}
    ${query}=    Replace String    ${query}    %TABLE_NAME%    ${table_name}
    ${result}=    Execute Query    ${query}
    Log    ${result}
    Should Be Equal As Numbers    ${result[0][0]}    ${expected_count}