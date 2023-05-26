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
    And I should see "#edit-actions-submit"
    And I should see "info@webship.co"
    And I should see "Location map"