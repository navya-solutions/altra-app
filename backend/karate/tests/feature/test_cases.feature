Feature: Test Hasura Engine GraphQL API

Background:
* url 'http://host.docker.internal:8080/v1/graphql'


Scenario: Can Create Countries
    Given def query = read('../create_country.gql')
    And request { query: '#(query)' }
    #And header x-hasura-admin-secret = 'admin_secret_for_testing'
    #And header x-hasura-role = 'admin'
    #And header x-hasura-user-id = 1
    When method post
    * status 200
    * match response == "#object"
    * match response.errors == '#notpresent'
    * def row_obj = response.data.insert_country
    * match row_obj contains { affected_rows : 2 }

Scenario: Can Create Languages
    Given def query = read('../create_language.gql')
    And request { query: '#(query)' }
    #And header x-hasura-admin-secret = 'admin_secret_for_testing'
    #And header x-hasura-role = 'admin'
    #And header x-hasura-user-id = 1
    When method post
    * status 200
    * match response == "#object"
    * match response.errors == '#notpresent'
    * def row_obj = response.data.insert_country
    * match row_obj contains { affected_rows : 2 }

Scenario: Can Create Curriculum
    Given def query = read('../create_curriculum_with_topicLabels.gql')
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

Scenario: Can Create Topic for top level TopicLabel
    Given def query = read('../create_topic_for_first_topicLabel.gql')
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

Scenario: Can Create Topic for second level TopicLabel
    Given def query = read('../create_topic_for_second_topicLabel.gql')
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
    * match row_obj contains { affected_rows : 5 }

Scenario: Can Create Topic for third level TopicLabel
    Given def query = read('../create_topic_for_third_topicLabel.gql')
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

Scenario: Can Create Topic for fourth level TopicLabel
    Given def query = read('../create_topic_for_fourth_topicLabel.gql')
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
    * match row_obj contains { affected_rows : 2 }

Scenario: Can Create Block
    Given def query = read('../create_block.gql')
    And def block_spec = read('../json/block_spec.json')
    And def variables = { block_spec : '#(block_spec)'   }
    
    And request { query: '#(query)',  variables: '#(variables)' }
    #And header x-hasura-admin-secret = 'admin_secret_for_testing'
    #And header x-hasura-role = 'admin'
    #And header x-hasura-user-id = 1
    When method post
    * status 200
    * match response == "#object"
    * match response.errors == '#notpresent'
    * def row_obj = response.data.insert_block
    * match row_obj contains { affected_rows : 1 }    