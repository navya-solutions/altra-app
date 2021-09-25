Feature: Test Hasura Engine GraphQL API

Background:
* url 'http://host.docker.internal:8080/v1/graphql'


Scenario: Can Create Countries
    Given def query = read('../queries/setup/create_country.gql')
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
    Given def query = read('../queries/setup/create_language.gql')
    And request { query: '#(query)' }
    #And header x-hasura-admin-secret = 'admin_secret_for_testing'
    #And header x-hasura-role = 'admin'
    #And header x-hasura-user-id = 1
    When method post
    * status 200
    * match response == "#object"
    * match response.errors == '#notpresent'
    * def row_obj = response.data.insert_language
    * match row_obj contains { affected_rows : 2 }

Scenario: Can Create Institution
    Given def query = read('../queries/setup/create_institution.gql')
    And request { query: '#(query)' }
    #And header x-hasura-admin-secret = 'admin_secret_for_testing'
    #And header x-hasura-role = 'admin'
    #And header x-hasura-user-id = 1
    When method post
    * status 200
    * match response == "#object"
    * match response.errors == '#notpresent'
    * def row_obj = response.data.insert_institution
    * match row_obj contains { affected_rows : 1 }

Scenario: Can Create Curriculum
    Given def query = read('../queries/curriculum/create_curriculum_with_topicLabels.gql')
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
    #* match row_obj.returning[0].description =='Curriculum description'
    * match row_obj contains { affected_rows : 14 }    
    
Scenario: Can Create CFE topic for topicLabel sequece 1
    Given def query = read('../queries/topic/cfe/create_cfe_topic_for_topicLabel_seq_1.gql')
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
    #* match row_obj.returning[0].description =='Curriculum description'
    * match row_obj contains { affected_rows : 3 }    

Scenario: Can Create CFE topic for topicLabel sequece 2
    Given def query = read('../queries/topic/cfe/create_cfe_topic_for_topicLabel_seq_2.gql')
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

Scenario: Can Create CFE topic for topicLabel sequece 3
    Given def query = read('../queries/topic/cfe/create_cfe_topic_for_topicLabel_seq_3.gql')
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

Scenario: Can Create CFE topic for topicLabel sequece 4
    Given def query = read('../queries/topic/cfe/create_cfe_topic_for_topicLabel_seq_4.gql')
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
    * match row_obj contains { affected_rows : 11 }

Scenario: Can Create CFE topic for topicLabel sequece 5
    Given def query = read('../queries/topic/cfe/create_cfe_topic_for_topicLabel_seq_5.gql')
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
    * match row_obj contains { affected_rows : 5}

Scenario: Get All curriculums with all topics for defined level sequence
    Given def query = read('../queries/curriculum/get_all_curriculums_with_all_topics_for_defined_level_sequence.gql')
    And def variables = {"order_id": 1}
    And request { query: '#(query)', variables: '#(variables)' }
    #And header x-hasura-admin-secret = 'admin_secret_for_testing'
    #And header x-hasura-role = 'admin'
    #And header x-hasura-user-id = 1
    When method post
    * status 200
    * print 'response:', response
    * match response == "#object"
    * match response.errors == '#notpresent'
    * def count = (response.data.curriculum.length)
    * assert count >= 1

Scenario: Get All curriculums with all topicLabels and topics
    Given def query = read('../queries/curriculum/get_all_curriculums_with_all_topic_labels_and_topics.gql')
    And request { query: '#(query)' }
    #And header x-hasura-admin-secret = 'admin_secret_for_testing'
    #And header x-hasura-role = 'admin'
    #And header x-hasura-user-id = 1
    When method post
    * status 200
    * print 'response:', response
    * match response == "#object"
    * match response.errors == '#notpresent'
    * def count = (response.data.curriculum.length)
    * assert count >= 1

Scenario: Get topic tree structure upto 7th level
    Given def query = read('../queries/topic/get_topic_tree_structure_upto_7_levels.gql')
    And def variables = {"topic_id": 1}
    And request { query: '#(query)', variables: '#(variables)' }
    #And header x-hasura-admin-secret = 'admin_secret_for_testing'
    #And header x-hasura-role = 'admin'
    #And header x-hasura-user-id = 1
    When method post
    * status 200
    * print 'response:', response
    * match response == "#object"
    * match response.errors == '#notpresent'
    * def count = (response.data.topic.length)
    * assert count >= 1

Scenario: Can Create Block
    Given def query = read('../queries/block/create_block.gql')
    And def block_spec = read('../json-data/block_spec.json')
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