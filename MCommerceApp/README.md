# Following are the requirements from the client:

Please provide code examples for each of the following scenarios in the form of a `.swift` or `.kt` file.

- The code examples are theoretical and do not need to compile into a complete program.
- Feel free to reference external classes/dependencies to illustrate the point (e.g. a third party library, the Application object, theoretical classes). Communicating the central pattern is more important than typing out all of the details.
- Demonstrate the best practices you prefer to use for these scenarios.
- Format the code as you would in a production codebase (e.g. syntax, documentation, naming)
- If needed provide extra context in the form of code comments.
- Match the resulting filenames to the scenario name.

<div style="page-break-after: always;"></div>

### `scenario_1_api_request`

**Requirement:** We need to integrate with a new API that provides the user's current shopping bag information.

```
GET https://www.dsw.com/api/v1/bag
{
	"products": [
		{
			"sku": "12345",
			"displayName": "Winter Boot",
			"price": "54.99",
			"quantity": 4
		},
		...
	],
	"promos": [
		{
			"code": "SUMMER2020",
			"description": "$5 off any item!",
			"value": "5"
		},
		...
	],
	"summary": {
		"subtotal": "54.99",
		"tax": "3.50",
		"discounts": "5",
		"total": "53.49"
	}
}
```

__<span style="color:#3f40c8">Provide a code example that fetches this API and parses it into a model object.</span>__

<div style="page-break-after: always;"></div>

### `scenario_2_caching`

**Requirement:** We need to cache the data received from the bag API between app launches.

__<span style="color:#3f40c8">Provide a code example for caching the data and retrieving it back out of the cache. Include any configuration of the cache that is required on app launch.</span>__

<div style="page-break-after: always;"></div>

### `scenario_3_mvvm`

**Requirement:** We need to display the cached data to the user on the shopping bag page.

__<span style="color:#3f40c8">Provide a code example that constructs a view model out of the cached data, and uses that view model to populate a view.</span>__

<div style="page-break-after: always;"></div>

### `scenario_4_testing`

**Requirement:** Before we merge this functionality into our QA environment, we need to test it.

__<span style="color:#3f40c8">Provide a code example that executes unit tests against the functionality above.</span>__
