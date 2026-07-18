Feature: Pruebas de deposito

  @deposit
  Scenario: CP01-Agregar saldo a cuenta
    Given url "https://bankapi-n1t8.onrender.com"
    Given path "/api/deposits"
    And header Authorization = tokenUser
    And request
    """
    {
      "accountId": "#(fromAccount)",
      "amount": 100,
      "depositType": "bank_transfer",
      "reference": "Salary deposit"
    }
    """
    When method post
    Then status 201