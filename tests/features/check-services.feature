Feature: Check the Services page
  As an anonymous user
  I want to be able to visit the services page
  So that I know that the webship.co site is working

  Scenario: Check services
    Given I am on "/services"
    Then I should see "Services"

    # Check the box information
    And I should see "Automated Functional Testing Setup"
    And I should see "Setup Private Selenium Grid"
    And I should see "Configure Remote CI/CD"
    And I should see "Cucumber/Gherkin descriptions"

    # Check the link 
    # And I should see a "testing_setup" element
    When I click "contactus"
    Then I should see "Contact"
    When I move backward one page
    And I wait max of 3 seconds
    Then I should see "Services"
