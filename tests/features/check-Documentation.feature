Feature: Check the documentation page
  As an anonymous user
  I want to be able to visit the documentation page
  So that I know that the webship.co site is working

  Scenario: Check documentation
    Given I am on "/documentation"
     Then I should see "Documentation"
      And I should have a working header
      And I wait max of 3 minute
      And I should have a working footer
      And I wait max of 3 minute

  Scenario: Check the box information
    Given I am on "/documentation"
     Then I should see "Webship JS"
      And I should see "Integrations"
