*** Settings ***
Library           ../libraries/DatabaseLibrary.py
Library           String
Suite Setup       Connect To Database
Suite Teardown    Disconnect From Database
Test Template     Check Numbers Min Value In Column

*** Variables ***
${DB_QUERY_MIN}    SELECT MIN(%COLUMN_NAME%) FROM hr.%TABLE_NAME%

*** Test Cases ***                            COLUMN_NAME      TABLE_NAME    EXPECTED_MIN_VALUE
Check Min Value In max_salary Column           max_salary         jobs            5000.00
Check Min Value In employee_id Column          employee_id      employees           100
Check Min Value In department_id Column        department_id   departments           1


*** Keywords ***
Check Numbers Min Value In Column
    [Arguments]       ${column_name}    ${table_name}    ${expected_min_value}
    ${query}=    Replace String    ${DB_QUERY_MIN}    %COLUMN_NAME%    ${column_name}
    ${query}=    Replace String    ${query}    %TABLE_NAME%    ${table_name}
    ${result}=    Execute Query    ${query}
    Log    ${result}
    Should Be Equal As Numbers    ${result[0][0]}    ${expected_min_value}