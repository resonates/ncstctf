from flask import current_app
from cachelib.file import FileSystemCache
from cachelib.memcached import MemcachedCache
from cachelib.redis import RedisCache
from cachelib.simple import SimpleCache
from cachelib.uwsgi import UWSGICache

cacher: dict = {
    'filesystem': FileSystemCache,
    'memcached': MemcachedCache,
    'redis': RedisCache,
    'simple': SimpleCache,
    'uwsgi': UWSGICache
}


def get_cache():
    return cacher.get(current_app.config.get("CACHE_TYPE"))('./')
