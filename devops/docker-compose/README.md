# Altra backend docker compose

# Usage

## Prerequisite

### Environment Values (.env)

1. Copy `env.template` to `.env`
2. Update the individual environment variables by replacing `<VALUE>` with appropriate values

### DockerHub and Github Authentication

1. DockerHub: `docker login`

# Commands

1. To build or rebuild services

   `docber-compose --verbose -p altra-core build --no-cache`

2. To create and start containers

   `docker-compose -p altra-core up -d`

3. To view output from containers

   `docker-compose -p altra-core logs -f`

4. To run the Karate test suite

   `docker-compose -p altra-test-suite -f docker-compose-test-suite.yml up`

5. To Stop and remove containers, networks

   `docker-compose -p altra-core down`

6. To delete the docker volume

   `docker volume prune`
