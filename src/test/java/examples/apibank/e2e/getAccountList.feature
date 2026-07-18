Feature: Listar cuentas de usuario (Plantilla reutilizable)

  @getAccounts
  Scenario: Obtener lista de cuentas del usuario autenticado
    Given url "https://bankapi-n1t8.onrender.com"
    And header Authorization = "Bearer " + token
    And path "/api/accounts"
    When method get
    Then status 200
    * def accountsList = response.data

