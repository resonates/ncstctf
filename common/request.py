from flask import request


# req_arge = request.args
# req_json = request.json.get()


def xss_escape(s: str):
    if s is None:
        return None
    else:
        return s.replace("&", "&amp;").replace(">", "&gt;").replace("<", "&lt;").replace("'", "&#39;").replace('"',
                                                                                                               "&#34;")


def req_safe_json(key):
    if request.json.get(key, type=str):
        return request.json.get(key, type=str).replace("&", "&amp;").replace(">", "&gt;").replace("<",
                                                                                                  "&lt;").replace(
            "'", "&#39;").replace('"',
                                  "&#34;")
    else:
        return None


def req_safe_args(key):
    if request.args.get(key, type=str):
        return request.args.get(key, type=str).replace("&", "&amp;").replace(">", "&gt;").replace("<",
                                                                                                  "&lt;").replace(
            "'", "&#39;").replace('"',
                                  "&#34;")
    else:
        return None
