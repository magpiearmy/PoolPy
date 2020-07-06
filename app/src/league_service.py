from connection import DatabaseConnection
import division_service


def get_league_data():
    get_league_query = "SELECT league_id, name FROM league;"
    with DatabaseConnection() as db:
        cursor = db.cursor()
        cursor.execute(get_league_query)
        row = cursor.fetchone()
        cursor.close()
        league = map_row_to_league(row)
        league["divisions"] = division_service.get_divisions(league["league_id"])
        return league


def map_row_to_league(row):
    (league_id, league_name) = row
    return {
        "league_id": league_id,
        "league_name": league_name,
    }
