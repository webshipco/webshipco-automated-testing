Feature: Check the documentation page
  As a nonymouse user
  I want to be able to visit the documentation page
  So that I know that the webship.co site is working

  Scenario: Check documentation
    Given I am on the homepage 
    When I go to "documentation"
    Then I should see "Documentation"

   # Check the box information
    And I should see "Webship JS"
    And I should see "Integrations"


 # Check the header on the documentation page
    And I should see "Services"
    And I should see "Documentation"
    And I should see "Blog"
    And I should see "Log in"
    
 # Check the footer on the documentation page
    And I should see "Contact"
    And I should see "About us"
    And I should see "© Copyright 2023 Webship"
    And I should see "Github"
    And I should see "Gitlab"
    And I should see "Bitbucket"
    And I should see "Twitter"
    And I should see "Linkedin"
    And I should see "Youtube"