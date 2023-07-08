Feature: Check the blog page
  As an anonymous user
  I want to be able to visit the blog page
  So that I know that the webship.co site is working

  Scenario: Check blog
    Given I am on "/blog"
     Then I should see "Blog"


    # Check the header on the blog page
    And I should see "Services"
    And I should see "Documentation"
    And I should see "Blog"
    And I should see "Log in"

    # Check the footer on the blog page
    And I should see "Contact"
    And I should see "About us"
    And I should see "© Copyright 2023 Webship"
    And I should see "Github"
    And I should see "Gitlab"
    And I should see "Bitbucket"
    And I should see "Twitter"
    And I should see "Linkedin"
    And I should see "Youtube"