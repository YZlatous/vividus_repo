Scenario: Update a pet
Given request body: {
    "id": 0,
    "category": {
            "id": 0,
            "name": "rodents"
            },
    "name": "chinchilla",
    "photoUrls": ["https://someurl.com"],
    "tags": [
        {
            "id": 0,
            "name": "rodents"
        }
    ],
    "status": "available"
}
When I set request headers:
|name        |value           |
|Content-Type|application/json|
|api_key|https://petstore.swagger.io/oauth/authorize|
When I execute HTTP PUT request for resource with relative URL `/pet`
When I save JSON element value from `${response}` by JSON path `$.id` to story variable `id`
Then response code is equal to `200`

Scenario: Validate the pet is present
When I set request headers:
|name        |value           |
|Accept|application/json|
|Content-Type|application/json|
|api_key|https://petstore.swagger.io/oauth/authorize|
When I execute HTTP GET request for resource with relative URL `/pet/#{removeWrappingDoubleQuotes(${id})}`
Then JSON element value from `${response}` by JSON path `$.category.name` is equal to `rodents`
