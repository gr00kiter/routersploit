#!/usr/bin/env bash
IFS=' '
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color
MODULES_PATH=./routersploit/modules
FAILURE=0

FLAKE8_IGNORED_RULES='E501,W503'
FLAKE8=$(flake8 --ignore=$FLAKE8_IGNORED_RULES $MODULES_PATH)

if [ "$FLAKE8" ]; then
    echo -e "\n${RED}- flake8 violations:${NC}"
    echo -e $FLAKE8
    echo ""
    FAILURE=1 
else
    echo -e "${GREEN}+ flake8${NC}"
fi

exit $FAILURE
