Scenario: Login
Given I am on the main application page
When I click on element located by `caseSensitiveText(Bank Manager)`
Scenario: Add Customer
When I click on element located by `caseSensitiveText(Add Customer)`
When I enter `Harry` in field located by `fieldName(First Name)`
When I enter `Maguire` in field located by `fieldName(Last Name)`
When I enter `09909` in field located by `fieldName(Post Code)`
When I click on element located by `caseSensitiveText(Add Customer)->filter.index(2)`
Then an alert is present
