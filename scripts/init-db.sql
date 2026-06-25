-- MyShutterHost — Local Database Initialization
-- This runs automatically the first time Docker starts PostgreSQL

-- Create the main database (already created by POSTGRES_DB env var)
-- This script can be used to set up extensions

-- Enable UUID generation
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Enable pg_trgm for fuzzy text search (used for photo/gallery search)
CREATE EXTENSION IF NOT EXISTS "pg_trgm";

-- Enable unaccent for search normalization (international names)
CREATE EXTENSION IF NOT EXISTS "unaccent";
