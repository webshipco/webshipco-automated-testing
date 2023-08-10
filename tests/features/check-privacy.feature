Feature: Check the privacy page
  As an anonymous user
  I want to be able to visit the privacy page
  So that I know that the webship.co site is working

  Scenario: Check privacy
    Given I am on "/privacy-policy"
    Then I should see "Privacy Policy"
    And I should have a working header
    And I should have a working footer

  Scenario: Check the box information
    Given I am on "/privacy-policy"
    Then I should see "Data Collected"
    And I should see "Use of the Data"
    And I should see "Sharing of Data"
    And I should see "Cookies"
    And I should see "Opt-Out, Communication Preferences"
    And I should see "Security"
    And I should see "About Children"
    And I should see "Changes to the Privacy Policy"
