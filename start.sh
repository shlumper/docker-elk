docker-compose up -d
docker run -d --name couchbase-msb -p 8091-8096:8091-8096 -p 11210-11211:11210-11211 couchbase
sleep 15
curl -X POST -u Administrator:Administrator -d memoryQuota=2048 http://localhost:8091/pools/default
curl -v -X POST 'localhost:8091/pools/default/buckets' -u Administrator:Administrator -d name=bucket1 -d bucketType=couchbase -d ramQuotaMB=100 -d durabilityMinLevel=none -d flushEnabled=1 -d replicaIndex=0 
curl -v -X POST 'localhost:8091/pools/default/buckets' -u Administrator:Administrator -d name=default -d bucketType=couchbase -d ramQuotaMB=100 -d durabilityMinLevel=none -d flushEnabled=1 -d replicaIndex=0 
curl -v -X POST 'localhost:8091/pools/default/buckets' -u Administrator:Administrator -d name=nonExist -d bucketType=couchbase -d ramQuotaMB=500 -d durabilityMinLevel=none -d flushEnabled=1 -d replicaIndex=0
curl -v -X POST 'localhost:8091/pools/default/buckets' -u Administrator:Administrator -d name=test -d bucketType=couchbase -d ramQuotaMB=100 -d durabilityMinLevel=none -d flushEnabled=1 -d replicaIndex=0
