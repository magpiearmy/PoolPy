from dataclasses import dataclass


@dataclass
class Player:
    id: int
    name: str
    team_id: int
