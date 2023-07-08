Feature: Check the contact page
  As an anonymous user
  I want to be able to visit the contact page
  So that I know that the webship.co site is working

  Scenario: Check contact
    Given I am on "/contact"
    Then I should see "Contact"

    # Check the box information
    And I should see "Your Name"
    And I should see "Company name"
    And I should see "Business email"
    And I should see "Phone number"
    And I should see "Team size"
    And I should see "Job title"
    And I should see "Your message"
    And I should see "info@webship.co"
    And I should see "Location map"

    # Check the header on the contact page
    And I should see "Services"
    And I should see "Documentation"
    And I should see "Blog"
    And I should see "Log in"

    # Check the footer on the contact page
    And I should see "Contact"
    And I should see "About us"
    And I should see "© Copyright 2023 Webship"
    And I should see "Github"
    And I should see "Gitlab"
    And I should see "Bitbucket"
    And I should see "Twitter"
    And I should see "Linkedin"
    And I should see "Youtube"

    # Check the newsletter text
    And I fill in "Your Name" with "Jon Smith"
    And I fill in "Company name" with "Webship.co"
    And I fill in "Business email" with "tast@webship.co"
    And I fill in "Phone number" with "+212 (367) 487-7851"
    And I fill in "Team size" with "11"
    And I fill in "Job title" with "Administrative Assistant II"
    And I fill in "Your message" with "This is just an automated testing for webship.co site"
    And I press "Submit"