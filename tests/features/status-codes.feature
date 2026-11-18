Feature: Status codes
  As the owner of the site
  I want every main page to answer 200 and a missing page to answer 404
  So that a broken page or a lost one is found before a visitor finds it

  Each address is asked once, outside the browser, with a plain GET: no
  image, style sheet or script of the page is loaded.

  Background:
    Given the API base URL is "/"

  Scenario Outline: <path> answers 200
    When I send a GET request to "<path>"
    Then the API response code should be 200

    Examples:
      | path                                 |
      | /                                    |
      | /products                            |
      | /products/webship-js                 |
      | /products/webship-workspace          |
      | /services                            |
      | /docs                                |
      | /docs/webship-js/2.0.x               |
      | /blog                                |
      | /about-us                            |
      | /contact                             |
      | /privacy-policy                      |

  Scenario: A page that does not exist answers 404
    When I send a GET request to "/this-page-does-not-exist"
    Then the API response code should be 404
