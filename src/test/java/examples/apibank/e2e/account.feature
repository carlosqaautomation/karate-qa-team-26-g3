Feature: Modulo de cuentas


  @account
  Scenario: CP01-Listar cuentas ok con call
    Given url "https://bankapi-n1t8.onrender.com"
    Given header Authorization = tokenAuth
    And path "/api/accounts"
    When method get
    Then status 200
    * def accountId = response.data[0].id


  @balanceAccount
  Scenario: CP02-Obtener saldo de cuenta
    Given url "https://bankapi-n1t8.onrender.com"
    Given header Authorization = tokenAuth
    And path "/api/accounts/" + fromAccount + "/balance"
    When method get
    Then status 200
    * def balance = response.data.balance
