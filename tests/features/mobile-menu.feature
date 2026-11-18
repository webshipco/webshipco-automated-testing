@mobile
Feature: Main menu on a phone
  As a visitor on a phone
  I want the main menu behind the three-line Menu button
  So that I can open it, follow a link and close it again

  Until 2026-11-18 the Menu button did nothing on a phone: the menu never
  opened. The first scenario is the one that catches that. The menu is the
  same on every page: the scenarios start from About us, a light page,
  rather than from the home page and its video.

  Scenario: The Menu button opens the main menu and closes it again
    Given I am on "/about-us"
    Then I see visible menu button
    And I don't see main menu
    When I click on menu button
    Then I see visible main menu
    And the "Products" link should be visible
    And the "Docs" link should be visible
    And "button[aria-controls='header-nav']" should have attribute "aria-expanded" with value "true"
    When I click on menu button
    Then I don't see main menu
    And "button[aria-controls='header-nav']" should have attribute "aria-expanded" with value "false"

  Scenario: The Escape key closes the open menu
    Given I am on "/about-us"
    When I click on menu button
    Then I see visible main menu
    When I press the key "Escape"
    Then I don't see main menu

  Scenario: A link of the open menu opens its page
    Given I am on "/about-us"
    When I click on menu button
    Then "#header-nav a[href='/docs']" should be visible
    When I click the "Docs" link
    Then I should see the page title "Documentation"
    And the path should be "/docs"
    And I don't see main menu

  Scenario: A tap beside the open menu closes it
    On a screen wider than the menu (a tablet) the page shows beside the open
    menu, behind an overlay that closes the menu when tapped. The tap goes
    beside the menu: the middle of the overlay lies under the menu itself.
    (The overlay had no size until 2026-11-18.)

    Given I am viewing the site on a "tablet" screen
    And I am on "/about-us"
    When I click on menu button
    Then I see visible main menu
    And I see visible menu overlay
    When I tap menu overlay beside main menu
    Then I don't see main menu
