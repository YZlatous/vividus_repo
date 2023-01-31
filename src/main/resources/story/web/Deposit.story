Scenario: Login
Given I am on the main application page
When I click on element located by `caseSensitiveText(Customer Login)`
When I select `Hermoine Granger` in dropdown located `name(userSelect)`
When I click on element located by `caseSensitiveText(Login)`
Scenario: Deposit
When I click on element located by `caseSensitiveText(Deposit)->filter.index(1)`
When I enter `500` in field located by `fieldName(amount)`
When I click on element located by `caseSensitiveText(Deposit)->filter.index(2)`
When I click on element located by `caseSensitiveText(Transactions)`
When I wait until element located by `tagName(table)` appears
Then number of elements found by `caseInsensitiveText(500)` is >= `1`
