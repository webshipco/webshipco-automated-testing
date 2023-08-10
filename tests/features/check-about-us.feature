Feature: Check the about us page
  As an anonymous user
  I want to be able to visit the about us page
  So that I know that the webship.co site is working

  Scenario: Check about us
    Given I am on "/about-us"
    Then I should see "About us"
    And I should have a working header
    And I should have a working footer

  Scenario: Check the box information
    Given I am on "/about-us"
    Then I should see "Love to help in speeding up the work of having Automated Functional Acceptance Testing for products to ship websites in a swift way."
    And I should see "We LOVE to help with:"
