import os

DB_CONFIG = {
    "host": os.getenv("DB_HOST", "mysql"),
    "port": os.getenv("DB_PORT", "3306"),
    "user": os.getenv("DB_USER", "root"),
    "pwd": os.getenv("DB_PWD", "rootpwd1"),
    "db": os.getenv("DB_DATABASE", "pool"),
}
