Feature: Contact
  As a visitor who wants help with testing
  I want a contact form and an email address
  So that I can reach Webship.co

  This suite never sends the form: it checks the fields, and what the
  browser says of a value before anything would be sent.

  Scenario: The contact page gives an email address and a form that asks for a name, an email address and a message
    Given I am on "/contact"
    Then "title" should have text "Contact | Webship.co"
    And I should see the page title "Contact"
    And the link "info@webship.co" with the href "mailto:info@webship.co" should exist
    And the field "Your Name" should be required
    And the field "Business email" should be required
    And the field "Your message" should be required
    And the field "Company name" should not be required
    And the field "Phone number" should not be required
    And the field "Job title" should not be required
    And the option "11-50 employees" should exist within the select element "select[name='team_size']"

  Scenario: The browser checks the email address before anything is sent
    Given I am on "/contact"
    Then the field "Business email" should fail the browser's validation
    When I fill in "Business email" with "not an email address"
    Then the field "Business email" should fail the browser's validation
    When I fill in "Business email" with "visitor@example.com"
    Then the field "Business email" should pass the browser's validation
