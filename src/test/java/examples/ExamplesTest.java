package examples;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

/**
 * ╔════════════════════════════════════════════════════════════════╗
 * ║  🧪 TEST RUNNER MAESTRO - Karate QA Team G3                   ║
 * ║  Ejecuta TODAS las pruebas con soporte completo para tags     ║
 * ╚════════════════════════════════════════════════════════════════╝
 * 
 * EJECUCIÓN:
 * 
 * 1. EJECUTAR TODO:
 *    mvn clean test
 * 
 * 2. POR TAGS (ejemplos):
 *    mvn clean test -Dkarate.tags=@smoke                 # Solo smoke tests
 *    mvn clean test -Dkarate.tags=@apibank               # Solo APIBank
 *    mvn clean test -Dkarate.tags=@petstore              # Solo PetStore
 *    mvn clean test -Dkarate.tags=@jsonplaceholder       # Solo Users
 *    mvn clean test -Dkarate.tags=@login                 # Solo login
 *    mvn clean test -Dkarate.tags=@e2e                   # Solo e2e
 *    mvn clean test -Dkarate.tags="not @e2e"             # Todo excepto e2e
 * 
 * 3. COMBINACIONES:
 *    mvn clean test -Dkarate.tags="@smoke or @critical"  # OR lógico
 *    mvn clean test -Dkarate.tags="@apibank and @login"  # AND lógico
 *    mvn clean test -Dkarate.tags="@create or @update"   # CRUD sin delete
 * 
 * TAGS DISPONIBLES:
 * 
 * Módulos:        @apibank, @petstore, @jsonplaceholder, @booking
 * Tipos:          @smoke, @critical, @negative, @component, @e2e
 * Funcionalidad:  @login, @register, @account, @transfer, @deposit, @balance
 * HTTP Methods:   @create, @post, @get, @list, @update, @put, @delete
 * 
 * Ver GUIA_RUNNERS_Y_TAGS.md para documentación completa
 */
class ExamplesTest {

    /**
     * RUNNER MAESTRO: Ejecuta TODAS las pruebas
     * Soporta filtrado por tags mediante -Dkarate.tags
     *
     * Ejemplos:
     * mvn clean test                              # Todo
     * mvn clean test -Dkarate.tags=@smoke         # Solo smoke
     * mvn clean test -Dkarate.tags=@apibank       # Solo APIBank
     * mvn clean test -Dkarate.tags="not @e2e"     # Sin e2e
     */
    @Test
    void testAll() {
        // Leer tags desde propiedad del sistema Maven
        String tags = System.getProperty("karate.tags");

        // Construir y ejecutar el runner
        Results results;
        if (tags != null && !tags.trim().isEmpty()) {
            // Si hay tags, aplicarlos
            results = Runner.path("classpath:examples")
                    .tags(tags)
                    .parallel(5);
        } else {
            // Si no hay tags, ejecutar todo
            results = Runner.path("classpath:examples")
                    .parallel(5);
        }

        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
