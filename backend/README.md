# Backend

## Requirements

Backend library requires:

1. Node
2. Docker
3. Docker-compose
4. Harsura CLI

## Getting Started

1. Go to docker-compose folder and run `docker-compose up -d` to start docker containers for:

   1. postgres DB
   2. Hasura (graphql-engine)
   3. Elasticsearch
   4. kibana

2. Install Hasura CLI, skip if already installed.

```shell
npm install --global hasura-cli
```

3.  Go to hasura folder and apply Hasura metadata on a database

```shell
hasura metadata apply
```

4. Apply migration script to configure Harusa GraphQL Engine

```shell
hasura migrate apply
```

5. Reload Hasura GraphQL engine metadata on the database

```shell
hasura metadata reload
```

6. Verfiy Hasura configuration, use `http://localhost:8080/console/` to

#### How to access PostgresSQL DB from local system

![Access postgresDB from local server](setup/images/postgres-access-config-settings.PNG)

## Curriculum Data Modeling

### Curriculum data modeling with topicLabels, topics, levels and nested units

In this model, curriculum is defined for the fixed set of topicLabels. TopicLabels are the logical separation for
different topics and levels. Units are defined as combination of topic and level. We can have nested units which can be
connected with nested blocks.
![Curriculum data modeling](setup/images/curriculum-data-modeling-option1.png)

#### json example

```json
{
  "title": "MATHS-NATIONAL_5",
  "childUnits": [
    {
      "title": "Geometry-Easy",
      "childUnits": [],
      "topic": {
        "title": "Geometry",
        "topicLabel": "Section"
      },
      "level": {
        "title": "Easy",
        "topicLabel": "Section"
      }
    },
    {
      "title": "Algebra-Medium",
      "childUnits": [
        {
          "title": "Pythagoras-Easy",
          "childUnits": [],
          "topic": {
            "title": "Pythagoras",
            "topicLabel": "Section"
          },
          "level": {
            "title": "Easy",
            "topicLabel": "Section"
          }
        },
        {
          "title": "Circles-Easy",
          "childUnits": [],
          "topic": {
            "title": "Circles",
            "topicLabel": "Section"
          },
          "level": {
            "title": "Easy",
            "topicLabel": "Section"
          }
        }
      ],
      "topic": {
        "title": "Algebra",
        "topicLabel": "Section"
      },
      "level": {
        "title": "Medium",
        "topicLabel": "Section"
      }
    }
  ],
  "topic": {
    "title": "MATHS",
    "topicLabel": "Subject"
  },
  "level": {
    "title": "NATIONAL_5",
    "topicLabel": "Subject"
  }
}
```

### Curriculum data modeling with nested topics

In this model, curriculum is defined with nested topics. Each topic has title and label, title defines the topic name
while label defines the logical separation for different topics. We can have nested topics and those topics can be
connected with nested blocks.
![Curriculum data modeling](setup/images/curriculum-data-modeling-option2.png)

#### json example

```json
{
  "topics": [
    {
      "title": "Maths",
      "label": "Subject",
      "hasChildren": true,
      "children": [
        {
          "title": "NATIONAL_5",
          "label": "Section",
          "hasChildren": true,
          "children": [
            {
              "title": "Statistics",
              "label": "Part",
              "hasChildren": true,
              "children": [
                {
                  "title": "Circles",
                  "label": "Key Issue Level",
                  "hasChildren": false,
                  "children": []
                },
                {
                  "title": "Pythagoras",
                  "label": "Key Issue Level",
                  "hasChildren": false,
                  "children": []
                }
              ]
            },
            {
              "title": "Geometry",
              "label": "Part",
              "hasChildren": false,
              "children": []
            },
            {
              "title": "Algebra",
              "label": "Part",
              "hasChildren": false,
              "children": []
            }
          ]
        },
        {
          "title": "HIGHER",
          "label": "Section",
          "hasChildren": false,
          "children": []
        },
        {
          "title": "Avd. HIGHER",
          "label": "Section",
          "hasChildren": false,
          "children": []
        }
      ]
    },
    {
      "title": "History",
      "label": "Subject",
      "hasChildren": false,
      "children": []
    },
    {
      "title": "Science",
      "label": "Subject",
      "hasChildren": false,
      "children": []
    }
  ]
}
```
