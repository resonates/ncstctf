from pydantic import BaseModel


class FailApi(BaseModel):
    success: bool = False
    msg: list


class SuccessApi(BaseModel):
    success: bool = True
    msg: list


class res(BaseModel):
    msg: str
    code: int
    data: list
    count: int
    limit: int


class TableApi(BaseModel):
    res: res
