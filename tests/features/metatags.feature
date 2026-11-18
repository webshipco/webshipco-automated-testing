Feature: Page titles and metatags
  As a visitor who shares a link, and as a search engine
  I want each page to carry its own title, description and Open Graph tags
  So that a search result and a shared link say what the page is

  Scenario Outline: <page> has its title, a description and Open Graph tags
    Given I am on "<path>"
    Then "title" should have text "<title>"
    And the "description" meta tag should contain "<description>"
    And the "og:title" meta tag should be "<og title>"
    And the "og:description" meta tag should contain "<description>"
    And the page should have the canonical URL "<path>"

    Examples:
      | page              | path                                 | title                          | og title                    | description                                                   |
      | Webship-js        | /products/webship-js                 | Webship-js                     | Webship-js                  | Webship-js is an Automated Functional Acceptance Testing tool |
      | Webship Workspace | /products/webship-workspace          | Webship Workspace              | Webship Workspace           | Webship Workspace is a container-based development workspace  |
      | A release         | /products/webship-js/releases/2.0.12 | Webship-js 2.0.12 \| Webship.co | Webship-js 2.0.12           | Webship-js 2.0.12 is the result of reading the book           |
      | A blog post       | /blog/what-functional-testing        | What is Functional Testing?    | What is Functional Testing? | Functional testing is a type of software testing              |

  Scenario Outline: <page> has a description and an Open Graph title
    A link to the page shared on a social network shows text of its own.
    (Until 2026-11-18 the home page, Products, Services, Contact and the blog
    printed no description, and no page printed og:title.)

    Given I am on "<path>"
    Then the "description" meta tag should not be ""
    And the "og:title" meta tag should not be ""

    Examples:
      | page           | path            |
      | Home           | /               |
      | Products       | /products       |
      | Services       | /services       |
      | Documentation  | /docs           |
      | Blog           | /blog           |
      | About us       | /about-us       |
      | Contact        | /contact        |
      | Privacy policy | /privacy-policy |
