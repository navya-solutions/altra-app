Feature: Test Hasura Engine GraphQL API

Background:
* url 'http://host.docker.internal:8080/v1/graphql'


Scenario: Can Create Curriculum with TopicLabels
    Given def query = read('create_curriculum_with_topicLabels.gql')
    #And def variables = { title: 'karate_test', content: 'This is a test post for my Karate unit test.', status: 'draft' }
    And request { query: '#(query)' }
    #And header x-hasura-admin-secret = 'admin_secret_for_testing'
    #And header x-hasura-role = 'admin'
    #And header x-hasura-user-id = 1
    When method post
    * status 200
    * match response == "#object"
    * match response.errors == '#notpresent'
    * def row_obj = response.data.insert_curriculum
    * match row_obj.returning[0].description =='Curriculum description'

Scenario: Can Create Topic For top level TopicLabels
    Given def query = read('create_topic_for_first_topicLabels.gql')
    #And def variables = { title: 'karate_test', content: 'This is a test post for my Karate unit test.', status: 'draft' }
    And request { query: '#(query)' }
    #And header x-hasura-admin-secret = 'admin_secret_for_testing'
    #And header x-hasura-role = 'admin'
    #And header x-hasura-user-id = 1
    When method post
    * status 200
    * match response == "#object"
    * match response.errors == '#notpresent'
    * def row_obj = response.data.insert_topic
    * match row_obj contains { affected_rows : 3 }
