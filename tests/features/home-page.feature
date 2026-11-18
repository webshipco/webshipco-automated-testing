Feature: Home page
  As a visitor of webship.co
  I want the home page to say what Webship.co does and what is new
  So that I know where to go next

  Scenario: The home page says what Webship.co helps with and shows the latest releases
    Given I am on the homepage
    Then "title" should have text "Home | Webship.co"
    And I should be on the front page
    And "text=Love to help in speeding up the work of having Automated Functional Acceptance Testing" should be visible
    And "text='We LOVE to help with:'" should be visible
    And I see visible latest Webship-js release, latest Workspace release, latest book release

  Scenario: The latest Webship-js release opens its release page
    Given I am on the homepage
    When I click on latest Webship-js release
    Then "Releases" should be in the breadcrumb
    And "Webship-js" should be in the breadcrumb
    And the url should match "/products/webship-js/releases/[0-9]+[.][0-9]+[.][0-9]+$"

  Scenario: The newsletter form asks for an email address and is never sent
    Given I am on the homepage
    Then the field "Email" should be required
    And the link "Privacy Policy" with the href "/privacy-policy" should exist
    When I fill in "Email" with "not an email address"
    Then the field "Email" should fail the browser's validation
    When I fill in "Email" with "visitor@example.com"
    Then the field "Email" should pass the browser's validation

  @known-issue
  Scenario: The pictures of the latest blog posts open the posts
    The picture of each of the latest posts links to /media/<id>/edit, the
    form that edits the picture, which answers 403 to a visitor (found on
    2026-11-18). The picture should open the post, as its title does.

    Given I am on the homepage
    Then "main a[href*='/media/'][href$='/edit']" should have a count of 0
