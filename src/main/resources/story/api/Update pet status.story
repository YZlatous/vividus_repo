Scenario: Update a pet
Given request body: {
    "id": 0,
    "category": {
            "id": 0,
            "name": "string"
            },
    "name": "chinchilla",
    "photoUrls": ["string"],
    "tags": [
        {
            "id": 0,
            "name": "string"
        }
    ],
    "status": "pending"
}
When I set request headers:
|name        |value           |
|Content-Type|application/json|
|api_key|https://petstore.swagger.io/oauth/authorize|
When I execute HTTP PUT request for resource with relative URL `/pet`
Then response code is equal to `200`

Scenario: Validate store inventory
When I set request headers:
|name        |value           |
|Accept|application/json|
|Content-Type|application/json|
|api_key|https://petstore.swagger.io/oauth/authorize|
When I execute HTTP GET request for resource with relative URL `/store/inventory`
Then JSON element value from `${response}` by JSON path `$.pending` is greater than or equal to `1`
