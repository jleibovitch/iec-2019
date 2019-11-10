from flask import Flask, jsonify, request
from db import create_connection
import json

app = Flask(__name__)
connection = create_connection()


@app.route('/api/business/signin', methods=["POST"])
def get_business():


    data = request.get_json()

    cursor = connection.cursor()

    cursor.execute('select * from business where username=%s and password=%s', (data["username"], data["password"]))
    res = cursor.fetchone()

    status = 200 if res is not None else 404
    responseData = res if res is not None else {}

    jsonResponse = {
        "status": status,
        "response": responseData
    }

    cursor.close()

    return jsonify(jsonResponse)

@app.route('/api/business/signup', methods=["POST"])
def create_business():

    try:

        payload = request.get_json()

        cursor = connection.cursor()
        cursor.execute('insert into business(name, location, username, password, rating, email) values(%s, %s, %s, %s, %s, %s, %s)',
            (payload["name"], payload["location"], payload["username"], payload["password"], payload["rating"], payload["email"]))

        connection.commit()

        jsonResponse = {
            "status": "200",
        }
        cursor.close()
    except Exception as e:
        print(e)
        jsonResponse = {
            "status": "400",
        }


    return jsonify(jsonResponse)

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

    cursor.close()
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
        cursor.close()
    except Exception as e:
        print(e)
        jsonResponse = {
            "status": "400",
        }

    return jsonify(jsonResponse)

@app.route('/api/tasks/<userid>', methods=["GET"])
def get_user_jobs(userid):

    sql = """
    select b.name business_name, b.location, t.status task_status, j.description job_description, j.reward, j.title
    from task t
    join business b
      on b.id = t.business_id
    join job j
      on j.id = t.job_id
    where user_id=%s
    """

    cursor = connection.cursor()
    cursor.execute(sql, (userid))

    jsonResponse = {
            "status": "200",
            "response": [r[0] for r in cursor.fetchall()]
    }

    cursor.close()

@app.route('/api/tasks/create', methods=["POST"])
def add_task():
    try:
        payload = request.get_json()
        cursor = connection.cursor()
        cursor.excute("insert into task values(%s, %s, %s, %s)", payload['business_id'], payload['user_id'], '1', payload['job_id'])
        cursor.close()

        jsonResponse = {
            "status": "200",
        }

    except Exception as e:
        print(e)
        jsonResponse = {
            "status": "400",
        }



@app.route('/api/jobs/job', methods=["POST"])
def create_job():

    try:
        payload = request.get_json()
        cursor = connection.cursor()
        cursor.execute("insert into job(business_id, reward, description, location) values (%s, %s, %s, %s)",
        (payload["business_id"], payload["reward"], payload["description"], payload["location"]))
        cursor.commit()
        cursor.close()

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