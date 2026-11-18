Feature: Blog
  As a visitor who wants to learn about automated testing
  I want the blog to list the posts, newest first, and open each one
  So that I can read the posts and go back to the list

  Scenario: The blog lists the posts ten to a page, and the pager opens the next ten
    Given I am on "/blog"
    Then "title" should have text "Blog | Webship.co"
    And I should see the page title "Blog"
    And "main article" should have a count of 10
    When I click the "Next page" link
    Then the url should match "[?]page=1$"
    And "main article" should have a count of 10 within 10 seconds

  Scenario: A post shows its title, its date and the way back to the blog
    Given I am on "/blog/what-functional-testing"
    Then "title" should have text "What is Functional Testing?"
    And I should see the page title "What is Functional Testing?"
    And I should be on a "webblog" page
    And "Blog" should be in the breadcrumb
    And "main time[datetime^='2023-04-06']" should be visible
