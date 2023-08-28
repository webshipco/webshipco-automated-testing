Feature: Check the home page
  As an anonymous user
  I want to be able to visit the home page
  So that I know that the webship.co site is working

  Scenario: Check homepage
    Given I am on the homepage
     Then I should see "Love to help in speeding up the work of having Automated Functional Acceptance Testing for products to ship websites in a swift way."
      And I should have a working header
      And I wait max of 3 minute
      And I should have a working footer
      And I wait max of 3 minute

  Scenario: Check newsletter in homepage
    Given I am on the homepage
     When I fill in "Email" with "wspowage5@gmail.com"
      And I press "Subscribe"
      And I wait max of 3 seconds
      And I click "Privacy Policy"
      And I wait max of 3 seconds
     Then I should see "Privacy Policy"
