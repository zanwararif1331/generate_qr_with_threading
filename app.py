from asyncio.tasks import create_task
from flask import (Flask, g, redirect, render_template, request, session, url_for)
import os
import qrcode
import string
import random
import time
from threading import Thread
from flask_mysqldb import MySQL

app = Flask(__name__)
PICTURES_FOLDER = 'static/img/'
app.config['PICTURES_FOLDER'] = PICTURES_FOLDER
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'db_absensi'

mysql = MySQL(app)
pict=None

@app.route('/index', methods=['GET', 'POST'])
def read():
    if request.method == 'POST':
        cur = mysql.connection.cursor()
        cur.execute("SELECT id_karyawan, nama_karyawan, Hadir, Sakit, Izin, Alpha FROM karyawan")
        rv = cur.fetchall()
        qr()
        return render_template("index.html", value=rv, img=pict)
    return render_template("index.html")

def qr():
        global pict
        localtime = str(time.asctime( time.localtime(time.time()) ))
        qr = qrcode.make(localtime)
        file_name = ''.join(random.choice(string.ascii_letters) for x in range(5))
        name = f"qr-{file_name}.png"
        qr.save(os.path.join(PICTURES_FOLDER, name))
        pict = os.path.join(PICTURES_FOLDER, name)

def main():
        t1 = Thread(name='Thread_1', target=read)
        t2 = Thread(name='Thread_2', target=qr) 

        t1.start()
        t2.start()

        t1.join()
        t2.join()

if __name__ == '__main__':
    app.run(debug=True)
    main()
        
    