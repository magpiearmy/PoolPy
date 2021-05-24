from flask import Flask
import flask
import player_service
import league_service
import team_service
import fixtures_service

app = Flask(__name__)


@app.route("/division", methods=["POST"])
def create_division():
    return "Here's your response!"


@app.route("/league", methods=["GET"])
def get_league_data():
    league = league_service.get_league_data()
    return flask.jsonify({
        "league": league
    })


@app.route("/players", methods=["GET"])
def get_all_players():
    app.logger.info("Getting all players")
    players = player_service.get_all_players()
    app.logger.info(f"Returning players: {players}")
    return flask.jsonify({
        "players": players
    })


@app.route("/team", methods=["POST"])
def create_team():
    app.logger.info("Creating team")
    players = team_service.create_team()
    app.logger.info(f"Returning players: {players}")
    return flask.jsonify({
        "players": players
    })


@app.route("/fixtures", methods=["GET"])
def get_fixtures_and_results():
    app.logger.info("Retrieving all fixtures and results")
    fixtures = fixtures_service.get_all_fixtures()
    app.logger.info(f"Returning fixtures and results: {fixtures}")
    return flask.jsonify({
        "fixtures": fixtures
    })
