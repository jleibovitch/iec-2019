from flask import Flask, jsonify, request
from db import create_connection
import json

app = Flask(__name__)
connection = create_connection()

@app.route('/api/user/signin', methods=["POST"])
def get_user():


    data = request.get_json()

    cursor = connection.cursor()

    cursor.execute('select * from "user" where username=%s and password=%s', (data["username"], data["password"]))
    res = cursor.fetchone()

    status = 200 if res is not None else 404
    responseData = res if res is not None else {}

    jsonResponse = {
        "status": status,
        "response": responseData
    }

    return jsonify(jsonResponse)

@app.route('/api/user/signup', methods=["POST"])
def create_user():

    try:

        payload = request.get_json()

        cursor = connection.cursor()
        cursor.execute('insert into "user"(name, email, phone, username, password) values(%s, %s, %s, %s, %s)',
            (payload["name"], payload["email"], payload["phone"], payload["username"], payload["password"]))

        connection.commit()

        jsonResponse = {
            "status": "200",
        }
    except Exception as e:
        print(e)
        jsonResponse = {
            "status": "400",
        }

    return jsonify(jsonResponse)

if __name__ == '__main__':
    app.debug = True
    app.env = 'DEVELOPMENT'
    app.run()

    print("closing connection to db")
    if connection is not None:
        connection.close()