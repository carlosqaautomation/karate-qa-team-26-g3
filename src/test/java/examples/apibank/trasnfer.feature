Feature: Pruebas de el modulo de transferencia

  Background:
    * def apiLogin = call read('loginUser.feature@login')
    * def token = apiLogin.token
    Given url "https://bankapi-n1t8.onrender.com"

  Scenario Outline: CP01-Transferencia exitosa
    Given path "/api/transfers"
    And header Authorization = "Bearer " + token
    And request
    """
    {
      "fromAccountId": "<fromAccount>",
      "toAccountId": "<toAccount>",
      "amount": <amount>,
      "description": "Test transfer",
      "transferType": "internal"
    }
    """
    When method post
    Then status 201

  Examples:
    |fromAccount| toAccount| amount|
    |fb0abf0a-f3a9-45b3-8740-792de5cc6b06 | b0944cb4-2846-44b5-8196-3f790385be39 |  50  |