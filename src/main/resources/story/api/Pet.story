Scenario: Add a new pet
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
    "status": "available"
}
When I set request headers:
|name        |value           |
|Content-Type|application/json|
|api_key|https://petstore.swagger.io/oauth/authorize|
When I execute HTTP POST request for resource with relative URL `/pet`
When I save JSON element value from `${response}` by JSON path `$.id` to story variable `id`
Then response code is equal to `200`

Scenario: Validate the pet is present
When I set request headers:
|name        |value           |
|Accept|application/json|
|Content-Type|application/json|
|api_key|https://petstore.swagger.io/oauth/authorize|
When I execute HTTP GET request for resource with relative URL `/pet/#{removeWrappingDoubleQuotes(${id})}`
Then JSON element value from `${response}` by JSON path `$.name` is equal to `chinchilla`

Scenario: Place an order
Given request body: {
    "id": 0,
    "petId": ${id},
    "quantity": 1,
    "shipDate": "2023-01-31T17:19:51.878+0000",
    "status" : "placed",
    "complete" : "false"
}
When I set request headers:
|name        |value           |
|Content-Type|application/json|
|api_key|https://petstore.swagger.io/oauth/authorize|
When I execute HTTP POST request for resource with relative URL `/store/order`
When I save JSON element value from `${response}` by JSON path `$.id` to story variable `order_id`
Then response code is equal to `200`

Scenario: Verify order status
When I set request headers:
|name        |value           |
|Accept|application/json|
|Content-Type|application/json|
|api_key|https://petstore.swagger.io/oauth/authorize|
When I execute HTTP GET request for resource with relative URL `/store/order/#{removeWrappingDoubleQuotes(${order_id})}`
Then JSON element value from `${response}` by JSON path `$.status` is equal to `placed`
