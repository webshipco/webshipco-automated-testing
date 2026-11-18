@js-off
Feature: Page not found
  As a visitor who followed an old or a mistyped link
  I want a page that says it is not there
  So that I can go on from the main menu

  The browser logs the 404 of the page itself as a console error; @js-off
  keeps it out of the JavaScript error report.

  Scenario: A missing page says it was not found and keeps the main menu
    Given I am on "/this-page-does-not-exist"
    Then I should be on the 404 page
    And "title" should have text "Page not found | Webship.co"
    And "text=The requested page could not be found." should be visible
    And I see visible main menu
