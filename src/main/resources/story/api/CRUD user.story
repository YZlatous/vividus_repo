Scenario: Create a user
Given request body: {
                      "id": 0,
                      "username": "yzlat",
                      "firstName": "yuliia",
                      "lastName": "zlatous",
                      "email": "no@reply.com",
                      "password": "123Qwe",
                      "phone": "000-000-0000",
                      "userStatus": 0
                    }
When I set request headers:
|name        |value           |
|Content-Type|application/json|
|api_key|https://petstore.swagger.io/oauth/authorize|
When I execute HTTP POST request for resource with relative URL `/user`
Then response code is equal to `200`


Scenario: Update a user
Given request body: {
                      "id": 0,
                      "username": "yzlat",
                      "firstName": "yuliia",
                      "lastName": "zlatous",
                      "email": "no@reply.com",
                      "password": "123Qwe",
                      "phone": "111-000-0000",
                      "userStatus": 0
                    }
When I set request headers:
|name        |value           |
|Content-Type|application/json|
|api_key|https://petstore.swagger.io/oauth/authorize|
|Authorization|Basic #{encodeToBase64(yzlat:123Qwe)}|
When I execute HTTP PUT request for resource with relative URL `/user/yzlat`
Then response code is equal to `200`

Scenario: Verify user updated
When I set request headers:
|name        |value           |
|Content-Type|application/json|
|api_key|https://petstore.swagger.io/oauth/authorize|
When I execute HTTP GET request for resource with relative URL `/user/yzlat`
Then JSON element value from `${response}` by JSON path `$.phone` is equal to `111-000-0000`


Scenario: Delete a user
When I set request headers:
|name        |value           |
|Content-Type|application/json|
|api_key|https://petstore.swagger.io/oauth/authorize|
|Authorization|Basic #{encodeToBase64(yzlat:123Qwe)}|
When I execute HTTP DELETE request for resource with relative URL `/user/yzlat`
Then response code is equal to `200`

Scenario: Verify user deleted
When I set request headers:
|name        |value           |
|Content-Type|application/json|
|api_key|https://petstore.swagger.io/oauth/authorize|
When I execute HTTP GET request for resource with relative URL `/user/yzlat`
Then response code is equal to `404`
