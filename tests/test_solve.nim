import unittest

include ../src/solve

suite "solve":
    test "100, 100":
        check fn(100, 100) == 20_000
