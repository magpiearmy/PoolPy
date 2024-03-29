import psycopg2

from db import DB_CONFIG


class DatabaseConnection:
    def __enter__(self):
        self.connection = self._connect()
        return self.connection

    def __exit__(self, exc_type, exc_val, exc_tb):
        self._disconnect()

    def _connect(self):
        return psycopg2.connect(
            host=DB_CONFIG["host"],
            port=DB_CONFIG["port"],
            user=DB_CONFIG["user"],
            password=DB_CONFIG["pwd"],
            database=DB_CONFIG["db"]
        )

    def _disconnect(self):
        if self.connection:
            self.connection.close()
        self.connection = None
