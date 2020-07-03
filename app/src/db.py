import os

DB_CONFIG = {
    "host": os.getenv("DB_HOST", "db"),
    "port": os.getenv("DB_PORT", "5432"),
    "user": os.getenv("DB_USER", "user1"),
    "pwd": os.getenv("DB_PWD", "userpwd1"),
    "db": os.getenv("DB_DATABASE", "pool"),
}
