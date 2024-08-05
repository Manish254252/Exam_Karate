Feature: Verify all end points for product API
Background:
  * def sleep = function(pause){ java.lang.Thread.sleep(pause*1000) }
  * print 'before'
  * call sleep 20
  * print 'after'

  Scenario: Verify post End point of product API
    Given url 'https://freefakeapi.io/api/comments'
    And request read("classpath://Jsons/Create.json")
    And header Content-Type = 'application/json'
    When method post
    Then status 201
    

  Scenario: Verify get End point of product API
    Given url 'https://freefakeapi.io/api/comments'
    When method get
    Then status 200
    

  Scenario: Verify get by Id end point of product API
    Given url 'https://freefakeapi.io/api/comments/1'  
    When method get
    Then status 200
    

  Scenario: Verify put End point of product API
    Given url 'https://freefakeapi.io/api/comments/1'  
    And request read("classpath://Jsons/Update.json")
    And header Content-Type = 'application/json'
    When method put
    Then status 200
    

  Scenario: Verify patch End point of product API
    Given url 'https://freefakeapi.io/api/comments/1'  
    And request read("classpath://Jsons/patch.json")
    And header Content-Type = 'application/json'
    When method patch
    Then status 200
    

  Scenario: Verify delete End point of product API
    Given url 'https://freefakeapi.io/api/comments/1'
    When method delete
    Then status 204
    
