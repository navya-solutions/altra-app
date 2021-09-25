# Hasura configuration and usages

### Steps to configure the GraphQL Engine from the scratch

1. Install Hasura CLI

```shell
npm install --global hasura-cli
```

2. Create hasura project structure

```shell
hasura init
```

3. If the database is created from hasura console, use this command to sync Hasura GraphQL engine metadata( i.e.
   database, action, events etc.)

```shell
hasura md export
```

Other metadata available Commands:

```shell
apply         Apply Hasura metadata on a database
clear         Clear Hasura GraphQL engine metadata on the database
diff          (PREVIEW) Show a highlighted diff of Hasura metadata
export        Export Hasura GraphQL engine metadata from the database
inconsistency Manage inconsistent objects in Hasura metadata
reload        Reload Hasura GraphQL engine metadata on the database
```

4.  NOTE! Currently, we are using a Java project for defining, creating, maintaining and migrating project database schema. We will migrated from Java project solution to hasura CLI databases and its migration feature, but if we gernate schema from Java solution, following manual changes need to be done:

- Change "id" BIGINT --> "id" SERIAL
- Delete "CREATE SEQUENCE"

5. Create migration manually

```shell
hasura migrate create altra --database-name altra-db
```

6. Above command will create up and down migration SQL files in the migrations directory.
   Now, crete the database connection manully using Hasura console:
   Goto Hasura console, Data tab->Connect Database option to configure postgres DB
1. Database Display Name: altra-db
1. Data Source Driver: PostgreSQL
1. Connect Database Via: Database URL
1. Database URL: postgres://postgres:postgrespassword@postgres:5432/postgres

add the SQL statement to the up.sql file and apply the migration by running:

```shell
hasura migrate apply
```

7. Go to hasura console and apply the table and relationships tracking manually.

8. Configure block event
   Goto the console->events
   Create new event with following details:
   Trigger Name=block_events
   Database=altra-db
   Schema/Table=public/block
   Trigger Operations = select all
   Webhook URL=ttp://host.docker.internal:3000/block/block_events

9. Export GraphQL engine metadata from the database to local repo:

```shell
hasura md export
```

Additional Hasura command
hasura md diff - Preview the diff between Hasura metadata on Server and on local machine
hasura md export - Export Hasura GraphQL engine metadata from the database to local configuration

### Step to apply the project changes to GraphQL Engine

1. Install Hasura and configure the Database connection

```shell
DisplayName: altra-db
datasoruce driver: POstgreSQL
database URL :postgres://postgres:postgrespassword@postgres:5432/postgres
```

2. Apply the migration by running:

```shell
hasura migrate apply
```

3. Go to hasura console and apply the table and relationships tracking manually.
