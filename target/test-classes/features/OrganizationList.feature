Feature: Organization List API

  @setup
  Scenario: Retrieve the Organization List
    Given url 'https://gorest.co.in/public/v1/users'
    When method GET
    Then status 200
    * def orgUser = response.data
    * print orgUser

  Scenario Outline: Post api
    * print __row
    Given url 'http://ec2-3-6-166-37.ap-south-1.compute.amazonaws.com:9091/customer/v1/temp/save'
    And request {firstName:'#(name)',lastName:'#(email)',fullName:'#(gender)',mobileno:'#(status)'}
    When method POST
    Then status 201
    * print response

    Examples: 
      | karate.setup().orgUser |
