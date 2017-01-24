debug:
	export NODE_OPTIONS="--debug"

start-admin:
	cd admin && make start

start-device:
	cd device && make start

mongod:
	mongod --replSet plusmore

mongo-mhq:
	mongo candidate.0.mongolayer.com:10412/plusmore -u plusmore -p

mhq:
	mongodump --host candidate.11.mongolayer.com:10410 --db plusmore -u plusmore -p -o /data/backup/plusmore
	mongorestore -host localhost --port 27017 --drop /data/backup/plusmore

backup-prod:
	mongodump --host candidate.11.mongolayer.com:10410 --db plusmore -u plusmore -p -o /data/backup/

backup-to-qa:
	mongorestore --db plusmore -u plusmore -p --host c817.candidate.14.mongolayer.com --port 10817 --drop /data/backup/plusmore/
