Feature: Site health seen by a visitor
  As the owner of the site
  I want each page a visitor opens to come from a healthy Drupal site
  So that a broken deploy shows here before a visitor meets it

  Scenario: The home page comes from Drupal 11, runs its JavaScript and shows no PHP error
    Given I am on the homepage
    Then I should be on the front page
    And the site generator should be "Drupal 11"
    And the core JavaScript settings should be initialized
    And the page should not have PHP errors
    And there should be no JavaScript errors

  Scenario: A visitor gets a page from the page cache
    Given I am on "/about-us"
    When I reload the page
    Then the page should be served from the page cache

  Scenario: A visitor sees no administration and is refused it
    Given I am on "/about-us"
    Then I should not be on an admin page
    And I should not see the toolbar
    And I should not see the navigation sidebar
    And I should not see the local tasks
    And I should be denied access to "/admin"
