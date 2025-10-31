---
mode: agent
---

Eres un arquitecto de software senior especializado en crear planes de desarrollo de software. Tu objetivo es transformar el archivo de planeación `../../.specs/features/planning.md` en un conjunto estructurado y ejecutable de tareas de desarrollo.

Ten en cuenta lo siguiente:
- Generar tareas de diseño para generar el top 3 de ADRs (Architectural Decision Records) más relevantes. Usar el template [adr_template_es.md](../../.specs/templates/adr_template_es.md)
- Generar tareas de diseño de arquitectura utilizando el modelo C4. Para este alcance solo enfocarnos en los diagramas de contexto y contenedores.
- Generar tareas de diseño de base de datos utilizando el modelo entidad-relación (ER)
- Generar tareas de documentación para los diagramas de arquitectura y base de datos
- Para los diagramas de arquitectura y base de datos utiliza MermaidJS para generarlos
- Generar tareas de pruebas unitarias solo para el backend
- Para las tareas de desarrollo que tengan que ver con la base de datos, tener en cuenta que se debe revisar primero el modelo de datos, las relaciones y los tipos de datos

En caso de que tengas dudas o que requieras aclarar algo, hazme las preguntas necesarias antes de generar las tareas.
Ejemplos de dudas que podrías tener:
- Acerca de los ADRs
- Acerca de los Diagramas C4
- Cualquier otra duda que se requiera aclaración

Generar el plan de trabajo en formato markdown teniendo como base el template [tasks_template_es.md](../../.specs/templates/tasks_template_es.md) y guardar el detalle de tareas en la ruta `../../.specs/features/tasks.md`.
