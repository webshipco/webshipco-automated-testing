Feature: Cookie consent
  As a visitor
  I want to choose which third-party services the site may use
  So that nothing tracks me without my consent

  The choice is kept in the "klaro" cookie of the browser, as JSON with its
  characters URL-encoded: "%22ga%22%3Atrue" is "ga":true.

  Scenario: Manage consents lists the services and links the privacy policy
    Given I am on "/about-us"
    When I click the "Manage consents" button
    And I wait for the modal to appear
    Then the modal should contain "Use of personal data and cookies"
    And the modal should contain "Google Analytics"
    And the modal should contain "YouTube"
    And the link "privacy policy" with the href "/privacy-policy" within the element "#klaro" should exist

  Scenario: Accepting a service is remembered in the consent cookie
    Given I am on "/about-us"
    When I click the "Manage consents" button
    And I wait for the modal to appear
    And I click on "#service-item-ga-title" in the modal
    And I click on "#service-item-youtube-title" in the modal
    Then the checkbox labeled "Google Analytics" should be checked
    And the checkbox labeled "YouTube" should be checked
    When I click "Save" in the modal
    And I wait for the modal to disappear
    Then a cookie with the name "klaro" and a value containing "%22ga%22%3Atrue" should exist
    And a cookie with the name "klaro" and a value containing "%22youtube%22%3Atrue" should exist

  Scenario: Declining the optional services is remembered in the consent cookie
    Given I am on "/about-us"
    When I click the "Manage consents" button
    And I wait for the modal to appear
    Then the checkbox labeled "Google Analytics" should be unchecked
    And the checkbox labeled "YouTube" should be unchecked
    When I click "Save" in the modal
    And I wait for the modal to disappear
    Then a cookie with the name "klaro" and a value containing "%22ga%22%3Afalse" should exist
    And a cookie with the name "klaro" and a value containing "%22youtube%22%3Afalse" should exist

  @known-issue @analytics
  Scenario: No analytics cookie is set before the visitor chooses
    The consent manager lists Google Analytics as off until the visitor turns
    it on, but the page loads Google Analytics on every visit whatever the
    choice: the gtag script is not held back by the consent manager, and the
    _ga cookies are set on the first page (found on 2026-11-18).

    Given I am on the homepage
    When I wait until the network is idle
    Then a cookie with a name containing "_ga" should not exist
