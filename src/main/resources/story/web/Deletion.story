Scenario: Login
Given I am on the main application page
When I click on element located by `caseSensitiveText(Bank Manager Login)`
Scenario: Add Customer
When I click on element located by `caseSensitiveText(Customers)`
When I change context to element located `By.xpath(//td[text()="Hermoine"]/ancestor::tr)`
When I click on element located by `caseSensitiveText(Delete)`
When I reset context
Then number of elements found by `caseSensitiveText(Hermoine)` is = `0`
