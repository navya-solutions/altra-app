# Docker-compose

## Commands

1. To build docker containers
   docker-compose --verbose -p altra-core build --no-cache

2. To run docker containers
   docker-compose -p altra-core up -d

3. To view the logs
   docker-compose -p altra-core logs -f

4. To run the Karate test suite
   docker-compose -p altra-test -f docker-compose-test.yml up

5. To delete the docker volume
   docker volume prune
