Feature: Services
  As a team that wants automated testing
  I want to see what Webship.co does for a project
  So that I can ask for it

  Scenario: The Services page lists what Webship.co offers
    Given I am on "/services"
    Then "title" should have text "Services | Webship.co"
    And I should see the page title "Services"
    And "text='Automated Functional Testing Setup'" should be visible
    And "text='Configure Remote CI/CD'" should be visible
    And "text='Cucumber/Gherkin descriptions'" should be visible

  Scenario: Contact Us on the Services page opens the contact page
    Given I am on "/services"
    When I click "Contact Us"
    Then I should see the page title "Contact"
    And the path should be "/contact"
