import sqlite3


try:
    sqliteConnection = sqlite3.connect('shop.db')
    cursor = sqliteConnection.cursor()
    print("Database created and Successfully Connected to SQLite")

    sqlite_select_Query = "select quantity from items where name='"+input()+"';"
    cursor.execute(sqlite_select_Query)
    record = cursor.fetchall()
    record = [i[0] for i in record]
    print("the quantity is:",record)
    cursor.close()

except sqlite3.Error as error:
    print("Error while connecting to sqlite", error)
finally:
    if sqliteConnection:
        sqliteConnection.close()
        print("The SQLite connection is closed")
