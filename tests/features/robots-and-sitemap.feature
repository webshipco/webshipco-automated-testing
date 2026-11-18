Feature: robots.txt and sitemap.xml
  As the owner of the site
  I want robots.txt to keep crawlers out of the back end and sitemap.xml to list the pages
  So that search engines index what a visitor should find

  Background:
    Given the API base URL is "/"

  Scenario: robots.txt keeps crawlers out of the administration and the login
    When I send a GET request to "/robots.txt"
    Then the API response code should be 200
    And the response header "content-type" should contain "text/plain"
    And the API response should contain "User-agent: *"
    And the API response should contain "Disallow: /admin/"
    And the API response should contain "Disallow: /user/login"

  Scenario: sitemap.xml lists the documentation and the blog posts
    When I send a GET request to "/sitemap.xml"
    Then the API response code should be 200
    And the response header "content-type" should contain "xml"
    And the API response should contain "<urlset"
    And the API response should contain "/docs/webship-js/2.0.x</loc>"
    And the API response should contain "/docs/webship-js/2.0.x/api-steps</loc>"
    And the API response should contain "/blog/what-functional-testing</loc>"

  Scenario: sitemap.xml lists the main pages of the site
    Besides the home page, the documentation and the blog posts, the sitemap
    lists the products, the blog itself, Services, About us, Contact and the
    privacy policy (since 2026-11-18). Its addresses are those of
    https://webship.co, the base URL the sitemap is built with.

    When I send a GET request to "/sitemap.xml"
    Then the API response code should be 200
    And the API response should contain "<loc>https://webship.co/products</loc>"
    And the API response should contain "<loc>https://webship.co/products/webship-js</loc>"
    And the API response should contain "<loc>https://webship.co/products/webship-workspace</loc>"
    And the API response should contain "<loc>https://webship.co/services</loc>"
    And the API response should contain "<loc>https://webship.co/blog</loc>"
    And the API response should contain "<loc>https://webship.co/about-us</loc>"
    And the API response should contain "<loc>https://webship.co/contact</loc>"
    And the API response should contain "<loc>https://webship.co/privacy-policy</loc>"
