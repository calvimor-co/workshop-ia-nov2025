#!/bin/bash

# Colors for output
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}🎨 Starting Top SaaS Frontend${NC}"
echo -e "${BLUE}================================${NC}"
echo ""

# Navigate to frontend directory
cd "$(dirname "$0")/../../src/frontend" || exit 1

# Start the server
echo -e "${GREEN}Starting Next.js development server...${NC}"
echo "📍 Frontend will be available at: http://localhost:3000"
echo ""

npm run dev
