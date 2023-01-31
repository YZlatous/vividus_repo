Scenario: Login
Given I am on the main application page
When I click on element located by `caseSensitiveText(Customer Login)`
When I select `Hermoine Granger` in dropdown located `name(userSelect)`
When I click on element located by `caseSensitiveText(Login)`
Scenario: Whithdrawl
When I click on element located by `caseSensitiveText(Withdrawl)`
When I enter `10000` in field located by `fieldName(amount)`
When I click on element located by `caseSensitiveText(Withdraw)`
Then number of elements found by `caseInsensitiveText(Transaction Failed. You can not withdraw amount more than the balance.)` is = `1`
