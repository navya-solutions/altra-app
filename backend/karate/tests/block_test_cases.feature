Feature: Test Hasura Engine GraphQL API

Background:
* url 'http://host.docker.internal:8080/v1/graphql'


Scenario: Can Create Block
    Given def query = read('create_block.gql')
    And def block_spec = read('json/block_spec.json')
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