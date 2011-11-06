Sample API documentation
========================

Todo: review content. layout probably unimportant at this stage.

Retrieving all child records  (scenario name probably)
----------------------------

* Path: /children/
* Method: GET
* Accept headers: application/json
* Parameters:
  * imei_number: Handset identifier
* Status code: 200

Sample response:

```json
[
  {
    "ID" : 1234,
    "Location" : "UK"
  }
]
```

* Alternative status codes:
 * 403: Not authenticated 
 * 401: User account is blocked
