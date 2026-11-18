Feature: Products and their releases
  As a visitor
  I want a page for each Webship product and for each of its releases
  So that I know what to install and what changed

  Scenario: The Products page lists the products with their logos
    Given I am on "/products"
    Then I should see the page title "Products"
    And "Home" should be in the breadcrumb
    And I should see an image with the "webship-js logo" alt text
    And I should see an image with the "Webship Workspace logo" alt text
    And the link "Webship-js" with the href "/products/webship-js" should exist
    And the link "Webship Workspace" with the href "/products/webship-workspace" should exist

  Scenario: The Webship-js page lists its step packs and its releases
    Given I am on "/products/webship-js"
    Then I should see the page title "Webship-js"
    And "Products" should be in the breadcrumb
    And "text='Step packs'" should be visible
    And the link "Drupal Core Steps" with the href "/docs/webship-js/2.0.x/drupal-core-step-definitions" should exist
    And I see visible latest Webship-js release

  Scenario: The Webship Workspace page says how to install it
    Given I am on "/products/webship-workspace"
    Then I should see the page title "Webship Workspace"
    And "Products" should be in the breadcrumb
    And "text='Install'" should be visible
    And "text=npm install -g @webship.co/workspace" should be visible
    And I see visible latest Workspace release

  Scenario: A release page names its product and links the release on GitHub
    Given I am on "/products/webship-js/releases/2.0.12"
    Then I should see the page title "2.0.12"
    And the breadcrumb should contain "Webship-js"
    And the breadcrumb should contain "Releases"
    And the link "Github link" with the href "https://github.com/webship/webship-js/releases/tag/2.0.12" should exist
