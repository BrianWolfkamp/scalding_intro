from flask import Flask, render_template, request
import MySQLdb

app = Flask(__name__)

#load data:
db = MySQLdb.connect(host="localhost", # your host, usually localhost
                     user="mlt", # your username
                      passwd="mlt", # your password
                      db="mlt") # name of the data base

cur = db.cursor() 

cur.execute("select * from movies")
allmovies = cur.fetchall()

@app.route("/", methods=['POST', 'GET'])
def mlt():
	cur.execute("SELECT * from results where movie_1_id=1 and corr<0.9   order by corr desc limit 0,15;")

	searched_id='-1'

	if request:
		searched=request.args.get('search', '').strip()
		cur.execute("select movieid from movies where name like'%"+searched+"%'" )
		searched_id=cur.fetchall()[0]
		if searched_id:
			cur.execute("SELECT * from results where movie_1_id=%s and corr<0.9   order by corr desc limit 0,15;" % searched_id)
		else:
			cur.execute("SELECT * from results where movie_1_id=1 and corr<0.9   order by corr desc limit 0,15;")



	print searched_id 
	rendered_result= render_template('./mlt.html',movies=allmovies, results=cur.fetchall(), searchedfor=searched )
	return rendered_result 

if __name__ == "__main__":
    app.run()

