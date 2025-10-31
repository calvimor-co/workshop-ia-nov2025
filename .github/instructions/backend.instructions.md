---
applyTo: "src/backend/**"
---

# FastAPI Python Web API

Propósito: crear endpoints REST seguros, testeables y claros. Seguir patrón Router → Service → Repository → SQLAlchemy (u otro ORM).

- Estilo y convenciones:
  - Usar `APIRouter` para organizar endpoints por dominio.
  - Routing con prefijos: `/api/v1/{resource}`.
  - Validación automática con Pydantic models (BaseModel).
  - No exponer modelos de BD directamente: usar schemas Pydantic (Request/Response).
  - Añadir `response_model` y `status_code` en decoradores de endpoints.
  - Type hints obligatorios en todas las funciones.

- Seguridad:
  - OpenAPI/Swagger automático en `/docs` y `/redoc`.
  - OAuth2 con JWT Bearer para auth. Usar `Depends(get_current_user)` con scopes.
  - Validación de roles/permisos mediante dependencies.
  - Centralizar manejo de errores con `HTTPException` y exception handlers personalizados.
  - CORS configurado explícitamente con `CORSMiddleware`.

- DI y arquitectura:
  - Usar `Depends()` para inyección de dependencias (servicios, repositorios, DB sessions).
  - Lifespan events para inicialización/cleanup de recursos.
  - Separar schemas (Pydantic), models (SQLAlchemy), routers, services y repositories.

- Pruebas:
  - pytest para unit tests e integración.
  - `TestClient` de FastAPI para tests de endpoints.
  - Fixtures para DB de prueba y mocks de dependencias.
  - Coverage mínimo del 60%.

- Logging y observabilidad:
  - Usar `logging` estándar de Python o `loguru`.
  - Middleware para logging de requests (método, path, status, tiempo).
  - Incluir `correlation_id` en logs para trazabilidad.
  - Structured logging en formato JSON para producción.

- CI/CD y checks:
  - Antes de merge: `ruff check`, `ruff format --check`, `mypy`, `pytest`, escaneo de dependencias con `safety`.
  - Revisión humana obligatoria para cambios en `src/` e `infrastructure/`.
  - Pre-commit hooks con `ruff` y `mypy`.

- Performance:
  - Operaciones async/await para I/O (DB, HTTP calls).
  - Paginación en endpoints que retornen listas.
  - Caché con dependencias (`@lru_cache` o Redis).

- Ejemplos de prompts:
  - `# copilot: Crear ProductRouter CRUD con schemas ProductCreate, ProductRead, ProductUpdate. Inyectar ProductService y devolver códigos correctos (200/201/400/404).`
  - `# copilot: Generar ProductRepository con SQLAlchemy (métodos async add/get_all/get_by_id/update/delete). Usar async session.`
  - `# copilot: Implementar middleware de autenticación JWT con FastAPI Security, validar token y extraer user claims.`
  - `# copilot: Crear tests pytest para ProductRouter usando TestClient y fixtures de DB en memoria.`