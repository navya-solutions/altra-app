# Backend

## Requirements

Backend library requires:

1. Node
2. Docker
3. Docker-compose
4. Hasura CLI

## Getting Started

1. Go to docker-compose folder and run `docker-compose up -d` to start docker containers for:

   1. PostgresSQL DB
   2. Hasura (graphql-engine)
   3. Elasticsearch
   4. kibana

2. Install Hasura CLI, skip package download if already installed.

```shell
npm install --global hasura-cli
```

3.  Go to hasura folder and import Hasura application metadata, using

```shell
hasura metadata apply
```

4. Apply migration script to configure Harusa GraphQL Engine, using

```shell
hasura migrate apply
```

5. Reload Hasura GraphQL engine metadata, using

```shell
hasura metadata reload
```

6. Run Hasura console using Hasura CLI, using `http://localhost:8080/console/` Or

```shell
hasura console
```

7. For creating test data Or running test scenarios, do to the docker-compose floder and run :

```shell
docker-compose -p altra-test -f docker-compose-test.yml up
```

Note! Test result repot are generated at backend/karate/results folder
