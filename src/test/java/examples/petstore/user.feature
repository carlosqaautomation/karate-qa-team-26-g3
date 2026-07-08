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
