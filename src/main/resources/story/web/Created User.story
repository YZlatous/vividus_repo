Scenario: Login
Given I am on the main application page
When I click on element located by `caseSensitiveText(Bank Manager Login)`
Scenario: Open Account
When I click on element located by `caseSensitiveText(Open Account)`
When I select `Hermoine Granger` in dropdown located `name(userSelect)`
When I select `Dollar` in dropdown located `name(currency)`
When I click on element located by `caseSensitiveText(Process)`
Then an alert is present
