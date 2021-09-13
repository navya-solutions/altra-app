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

3.  Go to hasura folder and import Hasura application metadata

```shell
hasura metadata apply
```

4. Apply migration script to configure Harusa GraphQL Engine

```shell
hasura migrate apply
```

5. Reload Hasura GraphQL engine metadata

```shell
hasura metadata reload
```

6. Verfiy Hasura configuration, using `http://localhost:8080/console/`

7. For creating test data Or running test scenarios :

```shell
docker-compose up
```

Note! Test result repot are generated at backend/karate/results folder
