WITH league_row AS (
    INSERT INTO league (name) VALUES
        ('The Pudsey Pool League')
        RETURNING league_id
)
INSERT INTO division (division_name, league_id)
VALUES
    ('Division One', (SELECT league_id FROM league_row)),
    ('Division Two', (SELECT league_id FROM league_row))
;


WITH div_teams (team_name, pub_name, division_name) AS (
VALUES
    ('Golden Lion', 'The Golden Lion', 'Division One'),
    ('The Taverners', 'The Pudsey Tavern', 'Division One'),
    ('147 Mavericks', '147 Sports Bar', 'Division One'),
    ('147 Underdogs', '147 Sports Bar', 'Division One'),
    ('The Old Hall', 'The Old Hall', 'Division One'),
    ('Crown & Anchor', 'Crown & Anchor', 'Division One'),
    ('Bramley Villagers', 'Bramley Villagers', 'Division One'),
    ('The Commercial (Pudsey)', 'The Commercial (Pudsey)', 'Division One'),
    ('Main Line Social A', 'Main Line Social Club', 'Division One'),
    ('Main Line Social B', 'Main Line Social Club', 'Division One'),
    ('The Nags Head', 'The Nags Head', 'Division One'),
    ('The Swinnow', 'The Swinnow', 'Division One'),
    ('Travellers', 'Travellers', 'Division Two'),
    ('Waggon & Horses', 'Waggon & Horses', 'Division Two'),
    ('The New Hall', 'The Old Hall', 'Division Two'),
    ('Bramley W.M.C.', 'Bramley W.M.C.', 'Division Two'),
    ('The Owl', 'The Owl', 'Division Two'),
    ('Leeds 147', '147 Sports Bar', 'Division Two'),
    ('The Commercial (Armley)', 'The Commerical (Armley)', 'Division Two'),
    ('The World''s End', 'The World''s End', 'Division Two'),
    ('The Great Northern', 'The Great Northern', 'Division Two'),
    ('The King''s Arms', 'The King''s Arms', 'Division Two'),
    ('The Village People', 'Bramley Villagers', 'Division Two')
)
INSERT INTO team (team_name, pub_name, division_id)
    SELECT div_teams.team_name, div_teams.pub_name, division.division_id
    FROM division
    JOIN div_teams ON division.division_name=div_teams.division_name
    ;

INSERT INTO team_fixture
(home_team_id, away_team_id, fixture_date)
VALUES
(
    (SELECT team_id FROM team WHERE team_name='Golden Lion'),
    (SELECT team_id FROM team WHERE team_name='The Taverners'),
    '2020-01-01'
),
(
    (SELECT team_id FROM team WHERE team_name='147 Mavericks'),
    (SELECT team_id FROM team WHERE team_name='147 Underdogs'),
    '2020-01-01'
),
(
    (SELECT team_id FROM team WHERE team_name='147 Mavericks'),
    (SELECT team_id FROM team WHERE team_name='Golden Lion'),
    '2020-01-08'
),
(
    (SELECT team_id FROM team WHERE team_name='The Taverners'),
    (SELECT team_id FROM team WHERE team_name='147 Underdogs'),
    '2020-01-08'
),
(
    (SELECT team_id FROM team WHERE team_name='Golden Lion'),
    (SELECT team_id FROM team WHERE team_name='The Taverners'),
    '2020-01-15'
),
(
    (SELECT team_id FROM team WHERE team_name='147 Mavericks'),
    (SELECT team_id FROM team WHERE team_name='147 Underdogs'),
    '2020-01-15'
)
;
