#!/bin/bash

# Colors for output
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}🚀 Starting Top SaaS Backend${NC}"
echo -e "${BLUE}================================${NC}"
echo ""

# Navigate to backend directory
cd "$(dirname "$0")/../../src/backend" || exit 1

# Activate virtual environment if it exists
if [ -d ".venv" ]; then
  source .venv/bin/activate
fi

# Start the server
echo -e "${GREEN}Starting FastAPI development server...${NC}"
echo "📍 Backend will be available at: http://localhost:8000"
echo "📖 API Docs available at: http://localhost:8000/docs"
echo ""

uv run fastapi dev
