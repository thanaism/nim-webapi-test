proc fn(x, y: int): int =
    return (x + y) * 100

when isMainModule:
    discard fn(100, 200)