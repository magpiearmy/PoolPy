from connection import DatabaseConnection


def map_row_to_fixture(row):
    (fixture_id, home_team_id, away_team_id, fixture_date) = row
    return {
        "fixture_id": fixture_id,
        "home_team_id": home_team_id,
        "away_team_id": away_team_id,
        "fixture_date": fixture_date.strftime("%Y-%m-%d"),
    }


def get_all_fixtures():
    get_all_fixtures_query = "SELECT team_fixture_id, home_team_id, away_team_id, fixture_date FROM team_fixture"
    with DatabaseConnection() as db:
        cursor = db.cursor()
        cursor.execute(get_all_fixtures_query)
        rows = cursor.fetchall()
        cursor.close()
        return [map_row_to_fixture(row) for row in rows]
