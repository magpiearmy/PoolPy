from connection import DatabaseConnection


def get_all_players():
    sql = "SELECT id, first_name, last_name, team_id FROM player;"
    with DatabaseConnection() as db:
        cursor = db.cursor()
        cursor.execute(sql)
        rows = cursor.fetchall()
        cursor.close()
        return rows
