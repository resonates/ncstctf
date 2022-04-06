import configparser

config_ini = configparser.ConfigParser()
config_ini.read('config.ini', encoding='utf-8')


def empty_str_cast(value, default=None):
    if value == "":
        return default
    return value


class ServerConfig(object):
    # 密钥
    SECRET_KEY: str = empty_str_cast(config_ini["server"]["SECRET_KEY"]) or 'pearadminflask'

    # SQLALCHEMY
    MYSQL_USERNAME = empty_str_cast(config_ini["mysql"]["MYSQL_USERNAME"]) or "root"
    MYSQL_PASSWORD = empty_str_cast(config_ini["mysql"]["MYSQL_PASSWORD"]) or "123456"
    MYSQL_HOST = empty_str_cast(config_ini["mysql"]["MYSQL_HOST"]) or "127.0.0.1"
    MYSQL_PORT = empty_str_cast(config_ini["mysql"]["MYSQL_PORT"]) or 3306
    MYSQL_DATABASE = empty_str_cast(config_ini["mysql"]["MYSQL_DATABASE"]) or "PearAdminFlask"

    SQLALCHEMY_DATABASE_URI = f"mysql+pymysql://{MYSQL_USERNAME}:{MYSQL_PASSWORD}@{MYSQL_HOST}:{MYSQL_PORT}/{MYSQL_DATABASE}?charset=utf8mb4"


    SQLALCHEMY_TRACK_MODIFICATIONS = True
    SQLALCHEMY_ECHO = False
    SQLALCHEMY_POOL_RECYCLE = 8
    # 缓存类型
    CACHE_TYPE: str = empty_str_cast(config_ini["server"]["CACHE_TYPE"]) or "filesystem"
    # JSON配置
    JSON_AS_ASCII = False
