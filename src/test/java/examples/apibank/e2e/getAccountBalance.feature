Feature: Obtener saldo de cuenta (Plantilla reutilizable)

  @getBalance
  Scenario: Obtener saldo de una cuenta
    Given url "https://bankapi-n1t8.onrender.com"
    And header Authorization = "Bearer " + token
    And path "/api/accounts/" + accountId + "/balance"
    When method get
    Then status 200
    * def accountBalance = response.data.balance

