Feature: Check the about us page
  As a nonymouse user
  I want to be able to visit the about us page
  So that I know that the webship.co site is working

  Scenario: Check about us
    Given I am on the homepage 
    When I go to "about-us"
    Then I should see "About us"

 # Check the box information
    And I should see "Love to help in speeding up the work of having Automated Functional Acceptance Testing for products to ship websites in a swift way."
    And I should see "We LOVE to help with:"

 # Check the header on the homepage
    And I should see "Services"
    And I should see "Documentation"
    And I should see "Blog"
    And I should see "Log in"
    
 # Check the footer on the homepage
    And I should see "Contact"
    And I should see "About us"
    And I should see "© Copyright 2023 Webship"
    And I should see "Github"
    And I should see "Gitlab"
    And I should see "Bitbucket"
    And I should see "Twitter"
    And I should see "Linkedin"
    And I should see "Youtube"