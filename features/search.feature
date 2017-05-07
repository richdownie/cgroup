@auth
Feature: Search Cukes

Scenario: Search for Senior Software Engineer QA opportunity
  Given I am on the home page
  And I search for "Senior Software Engineer"
  And I should see "Senior Software Test Engineer" on the page