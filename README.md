# Project Setup Instructions

## Prerequisites
Before setting up the project, ensure that you have the following prerequisites installed on your system:
1. **MSSQL ODBC Driver**: This project requires the MSSQL ODBC driver to connect to the MSSQL database. You can download and install it from the [official Microsoft website](https://docs.microsoft.com/en-us/sql/connect/odbc/download-odbc-driver-for-sql-server).

2. **Database Configuration**: You need to fill in your database configuration details and credentials in the database config file to connect to your MSSQL database.

## Setting Up a Virtual Environment
It is recommended to use a virtual environment for Python projects to manage dependencies separately from your global Python installation. Here's how you can set up a virtual environment:

1. **Install virtualenv** (if not already installed):
   ```
   pip install virtualenv
   ```

2. **Create a Virtual Environment**:
   Navigate to the project directory and run:
   ```
   virtualenv venv
   ```

3. **Activate the Virtual Environment**:
   - On Windows:
     ```
     .\venv\Scripts\activate
     ```

## Dependencies Installation
This project uses Poetry for dependency management. Below are the steps to install the required dependencies:

1. **Install Poetry**: If you do not have Poetry installed, you can install it by following the instructions on the [official Poetry website](https://python-poetry.org/docs/#installation).

2. **Install Project Dependencies**: Once Poetry is installed and your virtual environment is activated, you can install all the required dependencies by running the following command in the project directory:
   ```
   poetry install
   ```

### List of Dependencies
- **Python** version 3.12
- **Robot Framework** version 7.1
- **Robot Framework Database Library** version 2.0.2
- **pyodbc** version 5.1.0
- **Robot Framework ReportPortal** version 5.5.6

## Running Tests
To run all tests in the project folder, execute the `run_tests.sh` script:
```
./run_tests.sh
```

To run a specific test located in the `tests` folder, use the following command:
```
robot --outputdir ../output ./<test_name>.robot
```
Replace `<test_name>` with the name of the test file you want to run.

## Build System
This project uses Poetry as the build system with the following configuration:
- **Requires**: `poetry-core`
- **Build Backend**: `poetry.core.masonry.api`

Ensure you have properly configured the build system by ensuring the `pyproject.toml` file is set up correctly as per the above configuration.