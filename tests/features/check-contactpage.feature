Feature: Check the home page
  As a nonymouse user
  I want to be able to visit the contact page
  So that I know that the webship.co site is working

  Scenario: Check contactpage
    Given I am on the homepage 
    When I go to "contact"
    Then I should see "Contact"

 # Check the box information
    And I should see "Your Name"
    And I should see "Business email"
    And I should see "Your message"
    And I should see "info@webship.co"
    And I should see "Location map"

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