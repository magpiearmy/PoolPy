from connection import DatabaseConnection
from mysql.connector.cursor import MySQLCursorPrepared


def get_all_players():
    sql = "SELECT id, first_name, last_name, team_id from player;"
    with DatabaseConnection() as db:
        cursor = db.cursor(buffered=True, cursor_class=MySQLCursorPrepared)
        cursor.execute(sql)
        rows = cursor.fetchall()
        return rows
