Feature: Check the products page
  As an anonymous user
  I want to be able to visit the products page
  So that I know that the webship.co site is working

  Scenario: Check products
    Given I am on "/products"
     Then I should see "Products"
      And I should see "Webship-js"
      And I should see "Webship"
      And I should see "Cucumber"

  Scenario: Check Webship-js
    Given I am on "/products"
     When I click "Webship-js"
     Then I should see "Webship-js"
      And I should see "Webship-js is an Automated Functional Acceptance Testing tool"

  Scenario: Check Webship
    Given I am on "/products"
     When I click "Webship Portal"
     Then I should see "Webship Portal"
      And I should see "The Webship.co portal site was built on top of Drupal"

  Scenario: Check Cucumber
    Given I am on "/products"
     When I click "Cucumber"
     Then I should see "Cucumber"
      And I should see "Cucumber Automated Functional Acceptance Testing Management system"
