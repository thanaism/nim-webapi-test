import db_postgres
block:
    let db = open("127.0.0.1:5432","nim", "", "nim")
    let ddl = @[
        sql"""drop table sample""",
        sql"""create table sample (id integer, name varchar(50) not null)"""
    ]
    #[
        defer:
            X
        Y
    <--equals-->
        try:
            Y
        finally:
            X
    ]#
    defer:
        echo "db closed"
        db.close()
    # exec ddl
    for cmd in ddl:
        discard db.tryExec(cmd)
    # insert recode
    db.exec(sql"BEGIN")
    db.exec(sql"insert into sample values(?,?)", 1, "foo")
    db.exec(sql"insert into sample values(?,?)", ["2", "bar"])
    db.exec(sql"insert into sample values(?,?)", @["3", "baz"])
    db.exec(sql"COMMIT")
    # select
    for x in db.fastRows(sql"select id, name from sample order by id desc"):
        echo x