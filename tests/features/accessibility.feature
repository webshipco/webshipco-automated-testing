@a11y
Feature: Accessibility of the main pages
  As a visitor who uses a keyboard, a screen reader or a zoomed screen
  I want the main pages to follow WCAG 2.2 AA
  So that I can use the site like anyone else

  Scenario Outline: <page> has a language, landmarks, a skip link and named controls
    Given I am on "<path>"
    Then the page should declare a language
    And the page should have a main landmark
    And the page should have a navigation landmark
    And the page should have a skip link
    And every link should have an accessible name
    And every button should have an accessible name
    And every form field should have an accessible label
    And user zoom should be allowed
    And the page should pass the accessibility rules "button-name, link-name, label, html-has-lang, document-title, bypass, aria-valid-attr, aria-allowed-attr, duplicate-id-aria, list, listitem, meta-viewport"

    Examples:
      | page                  | path                             |
      | Home                  | /                                |
      | Products              | /products                        |
      | A documentation page  | /docs/webship-js/2.0.x/api-steps |
      | Blog                  | /blog                            |
      | Contact               | /contact                         |

  @known-issue
  Scenario Outline: <page> passes the WCAG 2.2 AA audit of axe
    Every main page fails it today on colours alone: the copyright line of
    the footer (white on the footer blue, 3.55:1), the link blue (4.29:1)
    and the grey of the documentation (4.37:1) are under 4.5:1
    (color-contrast, serious), and links in the text of the privacy policy
    are told apart by colour alone (link-in-text-block, serious). Fixed on
    2026-11-18: the alt text of the pictures, the colours of the code blocks
    and the keyboard reaching a code block that scrolls.

    Given I am on "<path>"
    Then the page should pass an accessibility audit at level "AA"

    Examples:
      | page                  | path                             |
      | Home                  | /                                |
      | Products              | /products                        |
      | Services              | /services                        |
      | A documentation page  | /docs/webship-js/2.0.x/api-steps |
      | Blog                  | /blog                            |
      | About us              | /about-us                        |
      | Contact               | /contact                         |
      | Privacy policy        | /privacy-policy                  |
