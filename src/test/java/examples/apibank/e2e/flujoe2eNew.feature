Feature: Flujo E2E de Transferencias Bancarias

  #Flujo e2e de transferencias
  #Paso 1: Iniciar sesion
  #Paso 2: Seleccionar cuenta
  #Paso 3: Verificar saldo SI saldo < 50 : Agrega saldo
  #Paso 4: Agregar cuenta destino manual
  #Paso 5: Ejecutar la transferencia -> configuracion de cuenta y monto

  Background:
    * def baseUrl = "https://bankapi-n1t8.onrender.com"
    * def transferAmount = 30
    * def minimumBalance = 50
    * def depositAmount = 100

  @flujoe2e @apibank @e2e @flow @transfer @complete @smoke
  Scenario: CP01-Flujo E2E completo de transferencia bancaria

    # PASO 1: Iniciar sesion - Reutilizando plantilla de login
    * def loginResponse = call read('../loginUser.feature@login')
    * def token = loginResponse.token
    * print "✓ PASO 1: Token obtenido exitosamente"

    # PASO 2: Seleccionar cuenta - Reutilizando plantilla de obtener cuentas
    * def accountsResponse = call read('getAccountList.feature@getAccounts')
    * def accounts = accountsResponse.accountsList
    * def fromAccountId = accounts[0].id
    * def toAccountId = accounts[1].id
    * print "✓ PASO 2: Cuentas seleccionadas"
    * print "  - Cuenta origen: " + fromAccountId
    * print "  - Cuenta destino: " + toAccountId

    # PASO 3: Verificar saldo de la cuenta origen - Reutilizando plantilla de saldo
    * def accountId = fromAccountId
    * def balanceResponse = call read('getAccountBalance.feature@getBalance')
    * def balance = balanceResponse.accountBalance
    * print "✓ PASO 3: Saldo verificado"
    * print "  - Saldo actual: $" + balance

    # PASO 3.1: Si saldo < 50, agregar saldo (deposito)
    * if (balance < minimumBalance)
      """
      Given url baseUrl
      And header Authorization = 'Bearer ' + token
      And path "/api/deposits"
      And request
      {
        "accountId": "#(fromAccountId)",
        "amount": #(depositAmount),
        "depositType": "bank_transfer",
        "reference": "E2E - Automatic deposit for transfer"
      }
      When method post
      Then status 201
      * print "✓ PASO 3.1: Depósito agregado"
      * print "  - Monto depositado: $" + depositAmount
      * def balance = depositAmount
      """

    # PASO 4: Preparar datos para transferencia
    * print "✓ PASO 4: Configuración de transferencia"
    * print "  - Monto a transferir: $" + transferAmount

    # PASO 5: Ejecutar la transferencia - Reutilizando plantilla de transferencia
    Given url baseUrl
    And header Authorization = "Bearer " + token
    And path "/api/transfers"
    And request
    """
    {
      "fromAccountId": "#(fromAccountId)",
      "toAccountId": "#(toAccountId)",
      "amount": #(transferAmount),
      "description": "E2E Test - Automated Transfer",
      "transferType": "internal"
    }
    """
    When method post
    Then status 201
    * def transactionId = response.data.id
    * print "✓ PASO 5: Transferencia ejecutada"
    * print "  - ID Transacción: " + transactionId

    # VALIDACION FINAL: Verificar que el saldo fue actualizado correctamente
    * def accountId = fromAccountId
    * def finalBalanceResponse = call read('getAccountBalance.feature@getBalance')
    * def newBalance = finalBalanceResponse.accountBalance
    * def expectedBalance = balance - transferAmount
    * print "✓ VALIDACIÓN FINAL: Saldo verificado"
    * print "  - Saldo anterior: $" + balance
    * print "  - Saldo actual: $" + newBalance
    * print "  - Saldo esperado: $" + expectedBalance
    * match newBalance == expectedBalance
    * print "\n╔════════════════════════════════════════╗"
    * print "║  ✓ FLUJO E2E COMPLETADO EXITOSAMENTE  ║"
    * print "╚════════════════════════════════════════╝"

