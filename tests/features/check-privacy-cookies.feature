Feature: Check the privacy page
  As an anonymous user
  I want to be able to visit the privacy page
  So that I know that the webship.co site is working

  Scenario: Check privacy
    Given I am on the homepage
     When I press "klaro_toggle_dialog" by attribute
     Then I should see "Use of personal data and cookies"
      And I should see "Please choose the services and 3rd party applications we would like to use."
      And I should see "privacy policy"
     When I click "service-item-youtube-title" by attribute
     Then I should see "YouTube is an online video sharing platform owned by Google."
      And I should see "Tracks online visits of the website as a service."
     When I click "service-item-ga-title" by attribute
     Then I should see "Toggle all services"
      And I should see "Use this switch to enable/disable all services."
     When I press "Save"
      
     

  
