docker network create -d bridge \
    --subnet=192.168.10.0/16 \
    db-net

docker run --rm -it --name node0 \
    --net=db-net \
    --ip=192.168.10.10 \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -v $(pwd)/node-0/conf/gnode-0.cnf:/etc/mysql/conf.d/galera.cnf \
    -v $(pwd)/node-0/data:/var/lib/mysql \
    mariadb:10.2 --wsrep-new-cluster

docker run -d --name node1 \
    --restart=always \
    --net=db-net \
    --ip=192.168.10.11 \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -v $(pwd)/node-1/conf/gnode-1.cnf:/etc/mysql/conf.d/galera.cnf \
    -v $(pwd)/node-1/data:/var/lib/mysql \
    mariadb:10.2

docker run -d --name node2 \
    --restart=always \
    --net=db-net \
    --ip=192.168.10.12 \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -v $(pwd)/node-2/conf/gnode-2.cnf:/etc/mysql/conf.d/galera.cnf \
    -v $(pwd)/node-2/data:/var/lib/mysql \
    mariadb:10.2

docker run --rm -it --name node0 \
    --net=db-net \
    --ip=192.168.10.10 \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -v $(pwd)/node-0/conf/gnode-0.cnf:/etc/mysql/conf.d/galera.cnf \
    -v $(pwd)/node-0/data:/var/lib/mysql \
    mariadb:10.2

docker run --name node0 \
    --net=db-net \
    --ip=192.168.10.10 \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -v $(pwd)/node-0/conf/gnode-0.cnf:/etc/mysql/conf.d/galera.cnf \
    -v $(pwd)/node-0/data:/var/lib/mysql \
    -d \
    mariadb:10.2 --wsrep-new-cluster

docker run --name node0 \
    --net=db-net \
    --ip=192.168.10.10 \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -v $(pwd)/node-0/conf/gnode-0.cnf:/etc/mysql/conf.d/galera.cnf \
    -v $(pwd)/node-0/data:/var/lib/mysql \
    -d \
    mariadb:10.2