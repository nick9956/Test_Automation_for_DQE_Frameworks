import os
import pyodbc
import configparser


class DatabaseLibrary:
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(DatabaseLibrary, cls).__new__(cls)
            cls._instance.conn = None
            cls._instance.cursor = None
        return cls._instance

    def connect_to_database(self):
        config = configparser.ConfigParser()
        db_config_path = os.getenv('DB_CONFIG_PATH', '../resources/db.cfg')
        config.read(db_config_path)
        driver = config['DatabaseConfig']['driver']
        server = config['DatabaseConfig']['server']
        tcon = config['DatabaseConfig']['tcon']
        database = config['DatabaseConfig']['database']
        username = config['DatabaseConfig']['username']
        password = config['DatabaseConfig']['password']
        
        # Connection string using ODBC Driver 17 for SQL Server
        connection_string = f'DRIVER={driver};SERVER={server};DATABASE={database};UID={username};PWD={password};Trusted_Connection={tcon}'
        try:
            self.conn = pyodbc.connect(connection_string)
            self.cursor = self.conn.cursor()
            print("Connected to database successfully")
            print(self.conn, self.cursor)
        except Exception as e:
            print(f"Failed to connect to database: {e}")
            self.conn = None
            self.cursor = None

    def disconnect_from_database(self):
        if self.conn:
            self.conn.close()
            print("Disconnected from database")

    def execute_query(self, query):
        self.cursor.execute(query)
        return self.cursor.fetchall()

    def execute_non_query(self, query):
        self.cursor.execute(query)
        self.conn.commit()
