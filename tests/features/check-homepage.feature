Feature: Check the home page
  As a nonymouse user
  I want to be able to visit the home page
  So that I know that the webship.co site is working

  Scenario: Check homepage
    Given I am on the homepage
    Then I should see "Love to help in speeding up the work of having Automated Functional Acceptance Testing for products to ship websites in a swift way."

 # Check the header on the homepage
    And I should see "Services"
    And I should see "Documentation"
    And I should see "Blog"
    And I should see "Log in"
    
 # Check the footer on the homepage
    And I should see "Contact"
    And I should see "About us"
    And I should see "© Copyright 2023 Webship"