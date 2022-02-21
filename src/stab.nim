import jester, strformat, json, strutils

routes:
    get "/":
        resp Http200, readFile("asset/top.json")