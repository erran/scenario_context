Feature: Scenarios with context via the @with_context tag
  After adding `require 'scenario_context/cucumber'` to env.rb use the
  `@with_context` tag to triggered the Before/After tagged hooks.

  Scenario: A regular scenario before a scenario with context
    No context is provided unless specified with the `@with_context` tag.

    Given I have no scenario context
    Then I should not have access to a scenario proxy

  @with_context
  Scenario: A scenario with a context
    The `@scenario_context` variable becomes available in your Ruby step
    definitions for the duration of your scenario/example row.

    Given I have a scenario context
    When I access the scenario proxy
    Then I should have access to the following methods
      | method name     |
      | file_colon_line |
      | name            |
      | outline         |
      | outline?        |
      And the scenario name should be "Scenario: A scenario with a context"

  Scenario: A regular scenario after a scenario with context
    The `@scenario_context` variable does not bleed through to the next scenario.

    Given I have no scenario context
    Then I should not have access to a scenario proxy

  @with_context
  Scenario Outline: A scenario outline with context
    The real value to using a `ScenarioContext` instead is that a uniform API
    is available while using Scenarios and ExampleRows.

    Given I have a scenario context
    When I access the scenario proxy
    Then I should have access to the following methods
      | method name     |
      | file_colon_line |
      | name            |
      | outline         |
      | outline?        |
      And the scenario name should be "Scenario Outline: A scenario outline with context, Examples (row <row number>)"

    Examples:
      | row number |
      | 1          |
      | 2          |
