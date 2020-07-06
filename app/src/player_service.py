from connection import DatabaseConnection


def get_all_players():
    sql = "SELECT player_id, first_name, last_name, team_id FROM player;"
    with DatabaseConnection() as db:
        cursor = db.cursor()
        cursor.execute(sql)
        rows = cursor.fetchall()
        cursor.close()
        return rows


def add_player(player):
    sql = "INSERT INTO player (first_name, last_name, team_id) VALUES (%s, %s, %s, %s);"
    with DatabaseConnection() as db:
        cursor = db.cursor()
        cursor.execute(sql, (
            player["first_name"],
            player["last_name"],
            player["team_id"]
        ))
        db.commit()
        cursor.close()
