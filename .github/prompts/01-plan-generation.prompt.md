---
mode: agent
---

# Descripción general

Quiero crear una aplicación full-stack para análisis de empresas SaaS, dirigida a inversionistas que desean evaluar métricas de las  compañías más importantes del mundo.

**Componentes:**
- **Frontend**: Dashboard interactivo con visualización de métricas
- **Backend**: API REST para consultas y filtros
- **Base de datos**: PostgreSQL normalizada en Supabase

**Fuente de datos:** Dataset de Kaggle - @https://www.kaggle.com/datasets/shreyasdasari7/top-100-saas-companiesstartups

---

# Stack tecnológico

## Tecnologías

### Frontend
- **Framework**: Next.js 16+ (App Router)
- **Lenguaje**: TypeScript
- **UI**: Tailwind CSS
- **Ubicación**: `src/frontend/`

### Backend
- **Framework**: FastAPI
- **Lenguaje**: Python 3.12+
- **ORM**: SQLAlchemy (async)
- **Gestor de paquetes**: `uv`
- **Ubicación**: `src/backend/`

### Base de datos
- **Motor**: PostgreSQL via Supabase
- **Script de creación**: `scripts/database/01-top-saas-db-creation.sql` (ya ejecutado)
- **Estado**: Tablas creadas y con datos cargados

---

# Dataset y modelo de datos

## Información del dataset
- **Fuente**: Kaggle - Top 100 SaaS Companies - @https://www.kaggle.com/datasets/shreyasdasari7/top-100-saas-companiesstartups
- **Registros**: 100 empresas
- **Campos clave**: 
  - Company Name
  - Industry/Category
  - Location (City, Country)
  - Products/Services
  - Founded Year
  - Total Funding
  - Annual Revenue
  - Valuation
  - Investors (puede ser lista separada por comas)

## Esquema de base de datos (ya creado)
Revisar `scripts/database/01-top-saas-db-creation.sql` para ver:
- Tabla `companies` (principal)
- Tabla `industries` (normalizada)
- Tabla `locations` (normalizada)
- Tabla `investors` (normalizada, si aplica)

---

# Funcionalidades principales

Para la primera versión, las funcionalidades principales son:

## Backend
- Endpoint para obtener el listado de empresas con filtros de búsqueda por industria y ubicación
- Endpoint para obtener las industrias que será usado por el filtro
- Endpoint para obtener las ubicaciones que será usado por el filtro

## Frontend
- Listado de empresas y sus métricas. Los campos a visualizar son:
  - Nombre empresa
  - Industria
  - Ubicación
  - Productos
  - Fecha de creación
  - Total inversión
  - Ingresos anuales
  - Valoración de la empresa
- El listado incluirá filtros de búsqueda por industria y ubicación

---

# Atributos de calidad

- Factibilidad. Necesitamos una arquitectura que sea factible de implementar en un tiempo razonable
- Mantenibilidad. La arquitectura debe ser fácil de modificar y ampliar en el futuro

---

# Patrón de arquitectura

## Backend: Arquitectura por capas
```
FastAPI (Routers)
    ↓
Services (lógica de negocio)
    ↓
Repositories (acceso a datos)
    ↓
SQLAlchemy Models (ORM)
    ↓
PostgreSQL (Supabase)
```

## Frontend: Arquitectura por capas
```
Next.js Pages/Components (UI)
    ↓
Custom Hooks (lógica de cliente)
    ↓
API Clients (fetching)
    ↓
Backend API (FastAPI)
```

---

# Objetivo

Utilizando la plantilla [planning_template_es.md](../../.specs/templates/planning_template_es.md), ayúdame a generar el archivo de planeación en la ruta `../../.specs/features/planning.md`.

## Entregables esperados

1. **Análisis de preguntas críticas**
   - Identifica las **3 preguntas más relevantes** que se requieran para completar el plan
   - Para cada pregunta, proporciona:
     - Contexto de por qué es importante
     - **2 opciones de respuesta** con pros/contras
     - Tu **recomendación fundamentada**

2. **Plan de desarrollo detallado**
   - Desglose de tareas por componente (backend, frontend, database)
   - Orden de implementación sugerido

3. **Decisiones arquitectónicas**
   - Justificación de patrones elegidos
   - Trade-offs considerados
   - Alternativas descartadas y por qué

## Formato de las preguntas

Para cada pregunta, sigue este formato:

**Pregunta N: [Título de la pregunta]**

**Contexto:** [Por qué es crítica esta pregunta]

**Opciones:**

A) **[Opción 1]**
   - ✅ Pros: ...
   - ❌ Contras: ...
   - 📊 Impacto: ...

B) **[Opción 2]**
   - ✅ Pros: ...
   - ❌ Contras: ...
   - 📊 Impacto: ...

**Recomendación:** [Opción recomendada + justificación]

---

## Comenzar

Por favor, **comienza analizando el contexto** y genera las 3 preguntas críticas antes de proceder con el plan completo.