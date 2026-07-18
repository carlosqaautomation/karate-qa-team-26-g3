Feature: Flujos e2e pruebas


  #Flujo e2e de transferencias
  #Paso 1: Iniciar sesion
  #Paso 2: Seleccionar cuenta
  #Paso 3: Verificar saldo SI saldo < 50 : Agrega saldo
  #Paso 4: Agregar cuenta destino manual
  #Paso 5: Ejecutar la transferencia -> configuracion de cuenta y monto

  Background:
    * def apiLogin = call read('../loginUser.feature@login')
    * def token = apiLogin.token
    Given url "https://bankapi-n1t8.onrender.com"
    * def tokenAuth = 'Bearer '+ token


  Scenario: CPTR1 Flujo e2e transferencia exitosa
    * def apiAccount = call read('account.feature@account')
    * def fromAccount = apiAccount.accountId
    * def apiAccountbalance = call read('account.feature@balanceAccount')
    * def balanceAccount = apiAccountbalance.balance
    * if (balanceAccount < 50) karate.call('deposit.feature@deposit')
    * def amount = 50
    * def toAccount = "b0944cb4-2846-44b5-8196-3f790385be39"
    * def apiTransfer = call read('transfer.feature@transfer')

