Feature: Check the privacy page
  As a nonymouse user
  I want to be able to visit the privacy page
  So that I know that the webship.co site is working

  Scenario: Check privacy
    Given I am on the homepage 
    When I go to "privacy-policy"
    Then I should see "Privacy Policy"

    # Check the box information
    And I should see "Data Collected"
    And I should see "Use of the Data"
    And I should see "Sharing of Data"
    And I should see "Cookies"
    And I should see "Opt-Out, Communication Preferences"
    And I should see "Security"
    And I should see "About Children"
    And I should see "Changes to the Privacy Policy"


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