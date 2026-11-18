Feature: Privacy policy
  As a visitor
  I want to read what the site collects and what it does with it
  So that I can decide what to share

  Scenario: The privacy policy covers the data, its use, cookies and children
    Given I am on "/privacy-policy"
    Then "title" should have text "Privacy Policy | Webship.co"
    And I should see the page title "Privacy Policy"
    And "text='Data Collected'" should be visible
    And "text='Use of the Data'" should be visible
    And "text='Sharing of Data'" should be visible
    And "text='Cookies'" should be visible
    And "text='Opt-Out, Communication Preferences'" should be visible
    And "text='Security'" should be visible
    And "text='About Children'" should be visible
    And "text='Changes to the Privacy Policy'" should be visible
