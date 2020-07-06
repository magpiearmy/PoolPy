from connection import DatabaseConnection


def add_team(team):
    sql = "INSERT INTO player (first_name, last_name, team_id) VALUES (%s, %s, %s, %s);"
    with DatabaseConnection() as db:
        cursor = db.cursor()
        cursor.execute(sql, (
            team["first_name"],
            team["last_name"],
            team["team_id"]
        ))
        team_id = cursor.fetchone()
        db.commit()
        cursor.close()
    return team_id
