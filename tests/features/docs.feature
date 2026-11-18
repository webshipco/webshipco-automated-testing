Feature: Documentation
  As a visitor who uses Webship-js or the Webship Workspace
  I want the documentation as a book with a sidebar
  So that I can read it page by page and find the step pack I need

  Scenario: The documentation home lists the book of each product
    Given I am on "/docs"
    Then "title" should have text "Documentation"
    And I should see the page title "Documentation"
    And the link "Webship JS 2.0.x" with the href "/docs/webship-js/2.0.x" should exist
    And the link "Webship Workspace 1.0.x" with the href "/docs/webship-workspace/1.0.x" should exist

  @desktop
  Scenario: The book sidebar marks the page being read
    Given I am on "/docs/webship-js/2.0.x/api-steps"
    Then I should see the page title "API Steps"
    And I see visible docs sidebar
    And "#docs-sidebar [aria-current='page']" should have text "API Steps"
    And the breadcrumb should contain "Documentation"
    And the breadcrumb should contain "Webship JS 2.0.x"

  Scenario: The book navigation opens the previous page
    Given I am on "/docs/webship-js/2.0.x/api-steps"
    Then "nav.book-navigation a[rel='prev']" should have attribute "href" with value "/docs/webship-js/2.0.x/step-definitions"
    When I click on the element "nav.book-navigation a[rel='prev']"
    Then I should see the page title "Step Definitions"
    And the path should be "/docs/webship-js/2.0.x/step-definitions"

  @mobile
  Scenario: The Contents button opens the book sidebar on a phone
    Given I am on "/docs/webship-js/2.0.x/api-steps"
    Then "#docs-sidebar [aria-current='page']" should not be in the viewport
    When I click the "Contents" button
    Then "#docs-sidebar [aria-current='page']" should be in the viewport within 5 seconds
    And "button[aria-controls='docs-sidebar']" should have attribute "aria-expanded" with value "true"

  Scenario: External Steps shows every step pack with its logo
    Given I am on "/docs/webship-js/2.0.x/extra-steps"
    Then I should see the page title "External Steps"
    And the images in "docs cards" should be loaded
    And the link "Drupal Core Steps" with the href "/docs/webship-js/2.0.x/drupal-core-step-definitions" within the element ".docs-cards" should exist

  Scenario: The page of a step pack says how to install the pack
    Given I am on "/docs/webship-js/2.0.x/drupal-core-step-definitions"
    Then I should see the page title "Drupal Core Steps"
    And "Webship JS 2.0.x" should be in the breadcrumb
    And "text=npm install --save-dev @webship-js/drupal-core-steps" should be visible
