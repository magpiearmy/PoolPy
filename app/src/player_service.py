from connection import DatabaseConnection


def map_row_to_player(row):
    (player_id, first_name, last_name, team_id) = row
    return {
        "player_id": player_id,
        "first_name": first_name,
        "last_name": last_name,
        "team_id": team_id
    }


def get_all_players():
    sql = "SELECT player_id, first_name, last_name, team_id FROM player;"
    with DatabaseConnection() as db:
        cursor = db.cursor()
        cursor.execute(sql)
        rows = cursor.fetchall()
        cursor.close()
        return [map_row_to_player(row) for row in rows]


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
