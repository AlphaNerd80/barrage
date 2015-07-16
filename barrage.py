
from stress_thread import stress_thread
import os
from flask import Flask


barrage = Flask(__name__)

@barrage.route('/')
@barrage.route('/index')
def index():
    thread1 = stress_thread(1,'thread-1', 1)
    thread2 = stress_thread(2,'thread-2', 2)
    thread3 = stress_thread(3,'thread-3', 3)

    return "OpenSSL Speed is working..."

if __name__ == "__main__":
    barrage.run(debug=True, host='127.0.0.1', port=int(os.getenv('VCAP_APP_PORT', '5000')))


    

