Feature: Check the One blog
  As an anonymous user
  I want to be able to visit the Webship-js: When I reload the page blog
  So that I know that the blog is working

  Scenario: Check the One blog
    Given I am on "/blog/webship-js-when-i-reload-page"
     Then I should see "Webship-js: When I reload the page"
      And I should have a working header
      And I should have a working footer

  Scenario: Check the One blog info
    Given I am on "/blog/webship-js-when-i-reload-page"
     Then I should see "Apr 22, 2025"
      And I should see "When designing automated tests for websites, we often focus on clicks, data entry, or verifying elements..."
      And I should see "Watch the recorded video of the robot while running the automated functional testing feature"
      And I should see "Conclusion"
     When I scroll down 1000
  
