# 🎯 Karate QA Team G3 - Testing de APIs

Testing de APIs mediante terminal con **Karate** + **Maven** + **JUnit5**

**Un único runner. Tags potentes. Control total.**

---

## 💡 El Concepto

```
UN RUNNER MAESTRO → ExamplesTest.java

  Ejecuta TODAS las pruebas
  
  + Filtra con TAGS (-Dkarate.tags=)
  
  = Control total y flexibilidad
```

**Ejemplo:**
```bash
mvn clean test                    # Todo
mvn clean test -Dkarate.tags=@smoke    # Solo rápido
mvn clean test -Dkarate.tags=@apibank  # Solo APIBank
```

---

## 🚀 Un Solo Runner - Múltiples Opciones

### El Concepto
```bash
# UN runner ejecuta TODO
mvn clean test

# TAGS controlan QUÉ se ejecuta
mvn clean test -Dkarate.tags=@tuTag
```

No necesitas múltiples runners ni comandos complicados. Todo pasa por `ExamplesTest.java` con etiquetas.

---

## 📚 Documentación

| Archivo | Propósito |
|---------|-----------|
| **GUIA_EJECUCION_PRUEBAS.md** | Guía completa y detallada |
| **GUIA_EJECUCION_TAGS.md** | Cómo usar tags (leer primero) |
| **COMANDOS_RAPIDOS.md** | Referencia rápida de comandos |
| **DOCUMENTACION_TECNICA.md** | Para crear nuevas pruebas |
| **FAQ_Y_TROUBLESHOOTING.md** | Solucionar problemas |

---

## 🚀 Inicio Rápido (20 segundos)

### Ejecución Básica
```bash
# Ejecutar TODAS las pruebas
mvn clean test
```

### Con Tags (Filtrado)
```bash
# Solo smoke tests (rápidos)
mvn clean test -Dkarate.tags=@smoke

# Solo APIBank
mvn clean test -Dkarate.tags=@apibank

# Solo login
mvn clean test -Dkarate.tags=@login

# Todo excepto e2e
mvn clean test -Dkarate.tags="not @e2e"

# Múltiples (OR)
mvn clean test -Dkarate.tags="@create or @update"
```

### Ver Reportes
```bash
open target/karate-reports/karate-summary.html
```

---

## 📊 Módulos y Tags

| Módulo | URL Base | Tag | Comando |
|--------|----------|-----|---------|
| 🏦 **APIBank** | https://bankapi-n1t8.onrender.com | `@apibank` | `mvn clean test -Dkarate.tags=@apibank` |
| 🐾 **PetStore** | https://petstore.swagger.io/v2 | `@petstore` | `mvn clean test -Dkarate.tags=@petstore` |
| 👥 **Users** | https://jsonplaceholder.typicode.com | `@jsonplaceholder` | `mvn clean test -Dkarate.tags=@jsonplaceholder` |

**Todos ejecutados por el mismo runner:** `ExamplesTest.java`

---

## ✅ Verificación de Instalación

Ejecuta estos comandos para verificar que tienes todo lo necesario:

```bash
# Verificar Java
java -version
# Debe mostrar versión 1.8 o superior

# Verificar Maven
mvn -version
# Debe mostrar versión 3.6.0 o superior

# Compilar proyecto
mvn compile
# Debe terminar con "BUILD SUCCESS"
```

Si algo falla, consulta **FAQ_Y_TROUBLESHOOTING.md**

---

## 📁 Estructura del Proyecto

```
.
├── pom.xml                          # Configuración Maven
├── src/test/java/
│   ├── karate-config.js            # Configuración global de Karate
│   ├── logback-test.xml            # Configuración de logs
│   └── examples/
│       ├── ExamplesTest.java       # Test Runner principal
│       ├── apibank/                # Pruebas de APIBank
│       │   └── loginUser.feature   # Features de login
│       ├── petstore/               # Pruebas de PetStore
│       │   └── user.feature        # Features de usuarios
│       └── users/                  # Pruebas de JSONPlaceholder
│           └── users.feature       # Features de usuarios
├── target/                          # Directorio compilado
│   ├── karate-reports/             # Reportes HTML
│   ├── karate-reports_*/           # Histórico de reportes
│   └── karate.log                  # Archivo de logs
│
├── GUIA_EJECUCION_PRUEBAS.md       # 📖 Guía completa
├── COMANDOS_RAPIDOS.md             # ⚡ Referencia rápida
├── DOCUMENTACION_TECNICA.md        # 📚 Para desarrolladores
├── FAQ_Y_TROUBLESHOOTING.md        # ❓ Solución de problemas
└── README.md                        # 👈 Este archivo
```

---

## 🎯 Casos de Uso Comunes

### Caso 1: Ejecutar todo
```bash
mvn clean test
```
📖 Ver: **GUIA_EJECUCION_TAGS.md** → "Ejecución Básica"

### Caso 2: Smoke tests (rápido)
```bash
mvn clean test -Dkarate.tags=@smoke
```
📖 Ver: **GUIA_EJECUCION_TAGS.md** → "Ejemplos Prácticos"

### Caso 3: Solo APIBank
```bash
mvn clean test -Dkarate.tags=@apibank
```

### Caso 4: Solo login (todos los módulos)
```bash
mvn clean test -Dkarate.tags=@login
```

### Caso 5: Ver el reporte
```bash
open target/karate-reports/karate-summary.html
```
📖 Ver: **GUIA_EJECUCION_PRUEBAS.md** → "Ver Reportes"

### Caso 6: Crear nuevas pruebas
📖 Ver: **DOCUMENTACION_TECNICA.md** → "Crear Features"

### Caso 7: Solucionar problemas
📖 Ver: **FAQ_Y_TROUBLESHOOTING.md** → Busca tu problema

---

## 📝 Tecnologías Utilizadas

```xml
Karate:              1.3.1
Java:                1.8+
Maven:               3.6.0+
JUnit:               5 (junit5-api)
HTTP Client:         Karate integrado
Test Framework:      Karate + Maven Surefire
Reportes:            HTML + JSON
```

---

## 🔧 Requisitos Mínimos

- **Java:** 1.8 o superior ✅
- **Maven:** 3.6.0 o superior ✅
- **Internet:** Para acceder a APIs externas ✅
- **Terminal:** macOS/Linux/Windows con bash ✅

---

## 📋 Verificación Rápida

Ejecuta este comando para verificar todo:
```bash
# Verificar Java y Maven
java -version && mvn -version

# Compilar proyecto
mvn clean compile

# Ejecutar un test pequeño
mvn clean test -Dtest=examples.users.UsersRunner
```

Si todo sale bien, verás: `BUILD SUCCESS` ✅

---

## 🌟 Ejemplos de Comandos Más Usados

```bash
# 1. Ejecutar todo
mvn clean test

# 2. Solo smoke tests
mvn clean test -Dkarate.tags=@smoke

# 3. Solo APIBank
mvn clean test -Dkarate.tags=@apibank

# 4. Solo login
mvn clean test -Dkarate.tags=@login

# 5. E2E solamente
mvn clean test -Dkarate.tags=@e2e

# 6. Sin e2e
mvn clean test -Dkarate.tags="not @e2e"

# 7. Múltiples tags (OR)
mvn clean test -Dkarate.tags="@create or @update"

# 8. Crear y actualizar solamente (sin delete)
mvn clean test -Dkarate.tags="(@create or @update) and not @delete"

# 9. APIBank sin e2e
mvn clean test -Dkarate.tags="@apibank and not @e2e"

# 10. Ver logs
cat target/karate.log
```

⚡ Ver más en **GUIA_EJECUCION_TAGS.md**

---

## 📊 Después de Ejecutar

Cuando ejecutes las pruebas, se genera:

```
target/
├── karate-reports/
│   ├── karate-summary.html    ← 👉 ABRE ESTO para ver resultados
│   ├── karate-debug.log
│   └── ...
└── karate.log                 ← Logs de ejecución
```

**Para ver resultados:**
```bash
open target/karate-reports/karate-summary.html
```

---

## 🆘 ¿Algo No Funciona?

### Paso 1: Verifica el problema
```bash
# ¿Java está instalado?
java -version

# ¿Maven está instalado?
mvn -version

# ¿Se puede compilar?
mvn compile
```

### Paso 2: Lee la documentación apropiada
- Error técnico → **FAQ_Y_TROUBLESHOOTING.md**
- Comando desconocido → **COMANDOS_RAPIDOS.md**
- No entiendes features → **DOCUMENTACION_TECNICA.md**

### Paso 3: Ejecuta con debug
```bash
mvn clean test -X
```

---

## 📚 Estructura de Documentación

```
GUIA_EJECUCION_PRUEBAS.md     Empezar aquí
    ↓
¿Necesitas referencia rápida?  
    → COMANDOS_RAPIDOS.md

¿Vas a crear pruebas?
    → DOCUMENTACION_TECNICA.md

¿Tienes un problema?
    → FAQ_Y_TROUBLESHOOTING.md
```

---

## 🎓 Tutorial: Ejecutar tu Primer Test

### 1. Verifica instalación
```bash
java -version
mvn -version
```

### 2. Navega a la carpeta
```bash
cd /Users/carloszambranosantos/Documents/TALLER-API-2026/GRUPO-3-QATEAM/karate-qa-team-26-G3
```

### 3. Ejecuta un test rápido (smoke)
```bash
mvn clean test -Dkarate.tags=@smoke
```

### 4. Abre el reporte
```bash
open target/karate-reports/karate-summary.html
```

### 5. ¡Éxito! 🎉
Si ves tests en verde, todo funciona correctamente.

### Próximo paso
Ejecuta todo:
```bash
mvn clean test
```

---

## 📞 Soporte y Recursos

- **GitHub Karate:** https://github.com/intuit/karate
- **Documentación:** https://github.com/intuit/karate/wiki
- **Stack Overflow:** Tag `karate` en StackOverflow
- **Ejemplos Oficiales:** https://github.com/intuit/karate/tree/master/karate-demo

---

## 🎯 Próximos Pasos Recomendados

1. ✅ **Lee:** `GUIA_EJECUCION_TAGS.md` (5 min) ← IMPORTANTE
2. ✅ **Ejecuta:** `mvn clean test -Dkarate.tags=@smoke` (2 min)
3. ✅ **Revisa:** El reporte HTML (2 min)
4. ✅ **Explora:** Las features en `examples/` (10 min)
5. ✅ **Crea:** Tu primer feature nuevo (20 min)

---

## 📝 Información del Proyecto

- **Grupo:** QA Team G3
- **Versión:** 1.0
- **Tipo:** API Testing con Karate
- **Versión Karate:** 1.3.1
- **Documentación:** Julio 21, 2026

---

## 🚀 ¡Estás Listo!

**Un runner, tags potentes, simplicidad máxima.**

### Comienza con:

```bash
# Ejecutar todo
mvn clean test

# O con tags
mvn clean test -Dkarate.tags=@smoke
```

### Aprende con:
- `GUIA_EJECUCION_TAGS.md` ← Empieza aquí
- `GUIA_EJECUCION_PRUEBAS.md` ← Información completa
- `DOCUMENTACION_TECNICA.md` ← Para crear pruebas

### Resuelve problemas con:
- `FAQ_Y_TROUBLESHOOTING.md` ← Busca tu problema

**¡Éxito en tus pruebas de API! 🎉**

---

*Documentación completa generada para GRUPO-3-QATEAM*
