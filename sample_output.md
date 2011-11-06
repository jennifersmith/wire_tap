Sample API documentation
========================

Todo: review content. layout probably unimportant at this stage.
We will probably need one feature per API call. The feature description can provide the heading. Would probably need one scenario covering the 200 'happy' path and a scenario for each error code.

I don't think we should document the authentication failures for every API call - maybe just for the authentication docs.


Retrieving all child records 
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

Updating a child record
-----------------------

* Path: /children/:id
* Method: POST
* Accept headers: application/json
* Parameters:
  * id : ID of the record to be updated
* Return status code: 204

Sample request:

```
location=UK
has_siblings=TRUE
```
