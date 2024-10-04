#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Define the path to the db.cfg file relative to the script location
export DB_CONFIG_PATH="$SCRIPT_DIR/resources/db.cfg"

# Define the directory containing the test cases
TEST_DIR="tests/"

# Define the output directory for the test results
OUTPUT_DIR="output/"

# Check if the output directory exists, if not, create it
if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p "$OUTPUT_DIR"
fi

# Run Robot Framework tests
robot --outputdir "$OUTPUT_DIR" "$TEST_DIR"

# Check if the tests were run successfully
if [ $? -eq 0 ]; then
    echo "Tests executed successfully."
else
    echo "Tests failed."
fi