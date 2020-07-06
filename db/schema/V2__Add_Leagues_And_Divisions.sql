WITH league_row AS (
    INSERT INTO league (name) VALUES
        ('The Pudsey Pool League')
        RETURNING league_id
), division_rows AS (
    INSERT INTO division (name, league_id) VALUES
        ('Division One', (SELECT league_id FROM league_row)),
        ('Division Two', (SELECT league_id FROM league_row))
        RETURNING division_id, name
)
INSERT INTO team (name, pub_name, division_id) VALUES
    ('Parky Travs', 'Travellers', (SELECT division_id FROM division_rows WHERE name='Division One')),
    ('The Taverners', 'The Pudsey Tavern', (SELECT division_id FROM division_rows WHERE name='Division One')),
    ('147 Mavericks', '147 Sports Bar', (SELECT division_id FROM division_rows WHERE name='Division One')),
    ('147 Underdogs', '147 Sports Bar', (SELECT division_id FROM division_rows WHERE name='Division One')),
    ('Travellers', 'Travellers', (SELECT division_id FROM division_rows WHERE name='Division Two')),
    ('Waggon & Horses', 'Waggon & Horses', (SELECT division_id FROM division_rows WHERE name='Division Two')),
    ('The New Hall', 'The Old Hall', (SELECT division_id FROM division_rows WHERE name='Division Two')),
    ('Bramley W.M.C.', 'Bramley W.M.C.', (SELECT division_id FROM division_rows WHERE name='Division Two'))