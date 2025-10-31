-- src/database/schema.sql
-- Este script crea el esquema inicial de la base de datos para PostgreSQL (Supabase).

-- Tabla para almacenar ubicaciones normalizadas
CREATE TABLE location (
    id BIGSERIAL PRIMARY KEY,
    city TEXT NOT NULL,
    state TEXT,
    country TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    created_by TEXT,
    updated_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    updated_by TEXT
);

-- Tabla para almacenar industrias únicas
CREATE TABLE industry (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    created_by TEXT,
    updated_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    updated_by TEXT
);

-- Tabla para almacenar inversores únicos
CREATE TABLE investor (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    created_by TEXT,
    updated_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    updated_by TEXT
);

-- Tabla principal para almacenar información de las empresas
CREATE TABLE company (
    id BIGSERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    products TEXT,
    founding_year INTEGER,
    total_funding BIGINT,
    arr BIGINT,
    valuation BIGINT,
    employees INTEGER,
    g2_rating REAL,
    industry_id BIGINT REFERENCES industry(id),
    location_id BIGINT REFERENCES location(id),
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    created_by TEXT,
    updated_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    updated_by TEXT
);

-- Tabla de unión para la relación muchos a muchos entre empresas e inversores
CREATE TABLE company_investor (
    company_id BIGINT REFERENCES company(id) ON DELETE CASCADE,
    investor_id BIGINT REFERENCES investor(id) ON DELETE CASCADE,
    PRIMARY KEY (company_id, investor_id)
);

-- Índices para mejorar el rendimiento de las consultas
CREATE INDEX idx_company_industry ON company(industry_id);
CREATE INDEX idx_company_location ON company(location_id);
CREATE INDEX idx_company_investor_company ON company_investor(company_id);
CREATE INDEX idx_company_investor_investor ON company_investor(investor_id);

-- Trigger para actualizar automáticamente updated_at en location
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_location_updated_at
    BEFORE UPDATE ON location
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Trigger para actualizar automáticamente updated_at en industry
CREATE TRIGGER update_industry_updated_at
    BEFORE UPDATE ON industry
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Trigger para actualizar automáticamente updated_at en investor
CREATE TRIGGER update_investor_updated_at
    BEFORE UPDATE ON investor
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Trigger para actualizar automáticamente updated_at en company
CREATE TRIGGER update_company_updated_at
    BEFORE UPDATE ON company
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();