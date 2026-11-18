Feature: Footer
  As a visitor at the bottom of any page
  I want the footer to link the company pages and the social accounts
  So that I can find them from every page

  Scenario: The footer links the company pages, the social accounts and the badge of this suite
    Given I am on "/services"
    Then I see visible footer menu, social links
    And the link "Privacy" with the href "privacy-policy" within the element "footer" should exist
    And the link "About us" with the href "about-us" within the element "footer" should exist
    And the link "Contact" with the href "contact" within the element "footer" should exist
    And the link "Github" with the href "https://github.com/webship" within the element "footer" should exist
    And the link "Gitlab" with the href "https://gitlab.com/webship" within the element "footer" should exist
    And the link "Bitbucket" with the href "https://bitbucket.org/webshipco" within the element "footer" should exist
    And the link "X" with the href "https://x.com/webshipco" within the element "footer" should exist
    And the link "Linkedin" with the href "https://www.linkedin.com/company/webshipco" within the element "footer" should exist
    And the link "Youtube" with the href "https://www.youtube.com/channel/" within the element "footer" should exist
    And I see visible testing badge
    And the element "footer a" with the attribute "href" and the value "https://github.com/webshipco/webshipco-automated-testing/actions" should exist

  Scenario: The footer and the logo link to the address of each page
    Given I am on "/services"
    Then "header a[href^='/index'], footer a[href^='/index']" should have a count of 0
