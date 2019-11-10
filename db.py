import psycopg2
from urllib.parse import urlparse

def create_connection():

  result = urlparse('postgres://luffptne:kmX4Ffmuq4CxASvA03_CqfuVmGTra9Ll@salt.db.elephantsql.com:5432/luffptne')
  username = result.username
  password = result.password
  database = result.path[1:]
  hostname = result.hostname
  connection = psycopg2.connect(
      database = database,
      user = username,
      password = password,
      host = hostname
  )

  return connection