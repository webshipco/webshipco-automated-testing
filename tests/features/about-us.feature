Feature: About us
  As a visitor
  I want to read who Webship.co is and what it loves to help with
  So that I know whom I would work with

  Scenario: About us says what Webship.co loves to help with
    Given I am on "/about-us"
    Then "title" should have text "About us | Webship.co"
    And I should see the page title "About us"
    And "text='We LOVE to help with:'" should be visible
    And "text='Automated Functional Testing setup and configurations for projects.'" should be visible
