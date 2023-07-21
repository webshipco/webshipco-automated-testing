Feature: Check the home page
  As an anonymous user
  I want to be able to visit the home page
  So that I know that the webship.co site is working

  Scenario: Check homepage
    Given I am on the homepage
    Then I should see "Love to help in speeding up the work of having Automated Functional Acceptance Testing for products to ship websites in a swift way."

    # Check the newsletter text
    And I fill in "Name" with "Winn Smith"
    And I fill in "Email" with "wspowage5@gmail.com"
    When I press "Subscribe"
    
  
    Then I should have a working header
    Then I should have a working footer