@desktop
Feature: Main menu on a desktop
  As a visitor on a desktop
  I want the main menu in the header of every page
  So that every section of the site is one click away

  The menu is the same on every page: the scenarios start from About us, a
  light page, rather than from the home page and its video. A link is
  followed only once its address is checked: the suite never opens an
  /index%2Ephp/ address (see the known issue at the end).

  Background:
    Given I am on "/about-us"

  Scenario: The main menu lists the sections of the site, each at its own address
    Then I see visible main menu
    And I don't see menu button
    And the link "Home" with the href "/" within the element "#header-nav" should exist
    And the link "Products" with the href "/products" within the element "#header-nav" should exist
    And the link "Services" with the href "/services" within the element "#header-nav" should exist
    And the link "Docs" with the href "/docs" within the element "#header-nav" should exist
    And the link "Blog" with the href "/blog" within the element "#header-nav" should exist
    And the link "About us" with the href "/about-us" within the element "#header-nav" should exist
    And the link "Contact" with the href "/contact" within the element "#header-nav" should exist
    And "#header-nav a" should have a count of 7
    And "#header-nav a[href^='/index']" should have a count of 0

  Scenario Outline: The "<link>" link of the main menu opens its page
    Then "#header-nav a[href='<path>']" should be visible
    When I click the "<link>" link
    Then I should see the page title "<heading>"
    And the path should be "<path>"

    Examples:
      | link     | heading       | path      |
      | Products | Products      | /products |
      | Services | Services      | /services |
      | Docs     | Documentation | /docs     |
      | Blog     | Blog          | /blog     |
      | Contact  | Contact       | /contact  |

  @known-issue
  Scenario: The main menu of the privacy policy links to the address of each page
    A request to /index%2Ephp/<page> (an encoded "index.php/") renders the
    links of the page's blocks with that prefix, and the cache keeps them for
    every visitor of <page>. On 2026-11-18 the main menu of the privacy
    policy links to /index%2ephp/products, /index%2ephp/docs and the others;
    the footer and the logo had such links the same morning. A redirect of
    /index.php/ and /index%2Ephp/ addresses to the address of the page keeps
    them out of the cache.

    Given I am on "/privacy-policy"
    Then "#header-nav a[href^='/index']" should have a count of 0
