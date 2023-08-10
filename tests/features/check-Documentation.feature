Feature: Check the documentation page
  As an anonymous user
  I want to be able to visit the documentation page
  So that I know that the webship.co site is working

  Scenario: Check documentation
    Given I am on "/documentation"
    Then I should see "Documentation"
    And I should have a working header
    And I should have a working footer

  Scenario: Check the box information
    Given I am on "/documentation"
    And I should see "Webship JS"
    And I should see "Integrations"
