Feature: Casos de prueba de registro de usuario

  Background:
    * def apiLogin = call read('loginUser.feature@login')
    Given url "https://bankapi-n1t8.onrender.com"

  Scenario: CP01-Registro de usuario Exitoso
    * def data =
    """
    {
      "email": "carloszs1@bankapi.com",
      "password": "password123",
      "fullName": "Carlos QA"
    }
    """
    And path "/api/auth/register"
    And request data
    When method post
    Then status 201
    And match response.data.user contains { "fullName": "Carlos QA"}


  Scenario: CP02-Registro usuario existente
    * def data =
    """
    {
      "email": "carloszs1@bankapi.com",
      "password": "password123",
      "fullName": "Carlos QA"
    }
    """
    And path "/api/auth/register"
    And request data
    When method post
    Then status 409
    * print response
    And match response.error == {"code": "USER_EXISTS","message": "User already exists"}