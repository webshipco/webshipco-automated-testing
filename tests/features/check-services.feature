Feature: Check the Services page
  As a nonymouse user
  I want to be able to visit the services page
  So that I know that the webship.co site is working

  Scenario: Check services
    Given I am on the homepage
    When I go to "services"
    Then I should see "Services"

    # Check the box information
    And I should see "Automated Functional Testing Setup"
    And I should see "Setup Private Selenium Grid"
    And I should see "Configure Remote CI/CD"
    And I should see "Cucumber/Gherkin descriptions"
    And I should see "Starting from $1,000"
    And I should see "Starting from $3,000"


    # Check the header on the services page
    And I should see "Services"
    And I should see "Documentation"
    And I should see "Blog"
    And I should see "Log in"

    # Check the footer on the services page
    And I should see "Contact"
    And I should see "About us"
    And I should see "© Copyright 2023 Webship"
    And I should see "Github"
    And I should see "Gitlab"
    And I should see "Bitbucket"
    And I should see "Twitter"
    And I should see "Linkedin"
    And I should see "Youtube"