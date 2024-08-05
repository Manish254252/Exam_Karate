Feature: verify all end points for product api
  Background:
#    The website we are testing doesn't allow too many request in short span
    And adding delay for every request

  Scenario:Verify post End point of product api
    Given user wants to call "/comments" end point
    And user sets header "Content-type" as "application/json"
    And  user add body from "filepath"
    When User performs post call
    Then verify status code is 201

  Scenario:Verify get End point of product api
    Given user wants to call "/comments" end point
    When User performs get call
    Then verify status code is 200

Scenario: Verify get by Id end point of product api
    Given user wants to call "/comments/@id" end point
    When User performs get call
    Then verify status code is 200


  Scenario:Verify put End point of product api
    Given user wants to call "/comments/@id" end point
    And user sets header "Content-type" as "application/json"
    And  user add body from "filepathUpd"
    When User performs put call
    Then verify status code is 200

  Scenario:Verify patch End point of product api
    Given user wants to call "/comments/@id" end point
    And user sets header "Content-type" as "application/json"
    And  user add body from "Patch"
    When User performs patch call
    Then verify status code is 200

  Scenario:Verify delete End point of product api
    Given user wants to call "/comments/@id" end point
    When User performs delete call
    Then verify status code is 204
