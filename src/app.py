from flask import Flask

app = Flask(__name__)


@app.route("/players")
def get_all_players():
    app.logger.info("Getting all players")
    return "Here's your response!"
