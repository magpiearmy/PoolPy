from connection import DatabaseConnection
from mysql.connector.cursor import MySQLCursorPrepared


def get_league_data():
    get_all_divisions_query = "SELECT id, name FROM league WHERE league_id=1;"
    with DatabaseConnection() as db:
        cursor = db.cursor(buffered=True, cursor_class=MySQLCursorPrepared)
        cursor.execute(get_all_divisions_query)
        division_rows = cursor.fetchall()
        return division_rows
