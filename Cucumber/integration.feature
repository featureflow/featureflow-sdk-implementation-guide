@integration
Feature: Integration
  Scenario Outline: Test that we can instantiate the client
    Given there is access to the Featureflow library
    And the FeatureflowClient is initialized with the apiKey "srv-env-9b5fff890c724d119a334a64ed4d2eb2"
    When the feature "<feature>" is evaluated along with the context key of "<key>"
    Then the result of the evaluation should equal <result>
  Examples:
    | feature          | key   | result                                                                                                                                                       |
    | test-integration | user1 | true
    | test-integration | user2 | false

  Scenario: Test that the client will throw an error when the wrong key is used
    Given there is access to the Featureflow library
    And the FeatureflowClient is initialized with the apiKey "notvalid"
    Then it should not return a featureflow client