from pydantic import BaseModel, validator
from flask_pydantic import validate

BaseModel, validator = BaseModel, validator
validate = validate


def xss_escape(s: str):
    if s is None:
        return None
    else:
        return s.replace("&", "&amp;").replace(">", "&gt;").replace("<", "&lt;").replace("'", "&#39;").replace('"',
                                                                                                               "&#34;")
