Feature: Casos de prueba de el moodulo User

  Scenario: CP-01 creacion de usuario exitoso
    Given url "https://petstore.swagger.io/v2"
    And path "user"
    And request
    """
    {
      "id": 0,
      "username": "JOSE",
      "firstName": "abc",
      "lastName": "perez",
      "email": "abc",
      "password": "11111",
      "phone": "21233333",
      "userStatus": 0
    }
    """
    When method post
    Then status 200
    * print response
    And match response.type == '#string'
    And match response.code == 200
    And match response.message == '#string'

  Scenario: CP-02 creacion de usuario con variable
    * def body =
    """
    {
      "id": 0,
      "username": "CARLOS",
      "firstName": "abc",
      "lastName": "perez",
      "email": "abc",
      "password": "11111",
      "phone": "21233333",
      "userStatus": 0
    }
    """
    Given url "https://petstore.swagger.io/v2"
    And path "user"
    And request body
    When method post
    Then status 200
    * print body


  Scenario: CP-03 actualizar usuario
    * def username = "pepito"
    Given url "https://petstore.swagger.io/v2"
    And path "user/" + username
    #And path "user" , username
    And request
    """
    {
      "id": 0,
      "username": "pepe",
      "firstName": "carlos",
      "lastName": "zambrano",
      "email": "abc@gmail.com",
      "password": "123456",
      "phone": "98765443",
      "userStatus": 0
    }
    """
    When method put
    Then status 200

  Scenario: CP-04 eliminar usuario
    * def username = "JOSE"
    Given url "https://petstore.swagger.io/v2"
    And path "user" , username
    When method delete
    Then status 200

  ##########################################################
  Scenario: CP-05 login exitoso
    Given url "https://petstore.swagger.io/v2"
    And path "user/login"
    And param username = "CALOS"
    And param password = "QATEAM"
    When method get
    Then status 200
    * print response.code
    And match response.code == 200
    And match response.type == "unknown"


  Scenario: CP-06 create booking
    Given url "https://restful-booker.herokuapp.com"
    And path "/booking"
    And header Accept = "application/json"
    And form field firstname = "Jim"
    And form field lastname = "Brown"
    And form field totalprice = 111
    And form field depositpaid = true
    And form field bookingdates[checkin] = "2018-01-01"
    And form field bookingdates[checkout] = "2018-01-02"
    When method post
    Then status 200


  Scenario: CP-07 create token
    Given url "https://restful-booker.herokuapp.com"
    And path "auth"
    And request { "username" : "admin","password" : "password123" }
    When method post
    Then status 200

  Scenario: CP-08 actualizar usuario con archivo externo
    * def username = "pepito"
    Given url "https://petstore.swagger.io/v2"
    And path "user" , username
    And request read('bodyActualizar.json')
    When method put
    Then status 200
    And match responseType == 'json'
    * print responseStatus



