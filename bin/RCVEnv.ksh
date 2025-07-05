#!/bin/ksh
# Environment configuration for the risque-bhv batch application.
# This script sets up variables used to execute Java jobs without running
# any job itself.

# Base directories
BASE_DIR="$(cd "$(dirname "$0")"/.. && pwd)"
BIN_DIR="$BASE_DIR/bin"
CONF_DIR="$BASE_DIR/config"
LIB_DIR="$BASE_DIR/lib"
DATA_DIR="$BASE_DIR/data"
LOG_DIR="$BASE_DIR/logs"

# Database parameters (uncomment the block matching the environment)
# DEV environment
#DB_HOST=dev-db.example.com
#DB_PORT=1521
#DB_SERVICE=DEVDB
#DB_USER=risque
#DB_PASS=devpassword

# QA environment
#DB_HOST=qa-db.example.com
#DB_PORT=1521
#DB_SERVICE=QADB
#DB_USER=risque
#DB_PASS=qapassword

# PROD environment
#DB_HOST=prod-db.example.com
#DB_PORT=1521
#DB_SERVICE=PRODDB
#DB_USER=risque
#DB_PASS=prodpassword

# Build Java classpath with all jars from lib
CLASSPATH=""
for jar in "$LIB_DIR"/*.jar; do
  [ -f "$jar" ] && CLASSPATH="$CLASSPATH:$jar"
done
CLASSPATH="$CLASSPATH:$BIN_DIR:$CONF_DIR"
export CLASSPATH

# Java executable and memory settings
JAVA_CMD=$(command -v java)
JAVA_MIN_MEM=256m
JAVA_MAX_MEM=512m
JAVA_OPTS="-Xms$JAVA_MIN_MEM -Xmx$JAVA_MAX_MEM"

# Batch file locations
DIST_DIR="$DATA_DIR/dist"
RECV_DIR="$DATA_DIR/recv"
CTRL_DIR="$DATA_DIR/ctrl"

# SQL parameters used by batch jobs
SQL_PATH="$CONF_DIR/sql"

# Fortanix configuration (external encryption service)
FORTANIX_ENDPOINT=https://fortanix.example.com
FORTANIX_API_KEY=your-api-key

