Feature: Home page

  Background:
    Given a fizz buzz exists with number: 3, favourite: true

  Scenario: When I am on the home page
    Given I go to the home page with params per_page: 3
    Then I expect to see the fizz buzz table
    And I expect to see a fizz buzz for the number 1
    And I expect to see a fizz buzz for the number 2
    And I expect to see a fizz buzz for the number 3
    And I expect not to see a fizz buzz for the number 4
    And I expect to see a favourite fizz buzz

  Scenario: When I use the pagination
    Given I go to the home page with params page: 1
    Then I expect to be on pagination page 1
    Then I expect not to see pagination previous button
    When I go to the home page with params page: 2
    Then I expect to be on pagination page 2
    And I expect to see pagination previous button
