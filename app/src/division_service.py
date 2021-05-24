from connection import DatabaseConnection


def get_divisions(league_id):
    get_divisions_query = "SELECT division_id, name FROM division WHERE league_id=%s;"
    with DatabaseConnection() as db:
        cursor = db.cursor()
        cursor.execute(get_divisions_query, (league_id,))
        rows = cursor.fetchall()
        cursor.close()
        return [map_row_to_division(row) for row in rows]


def map_row_to_division(row):
    (division_id, division_name) = row
    return {
        "id": division_id,
        "name": division_name,
    }
