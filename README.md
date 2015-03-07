
README
======

This shows basic authentication via devise with a json api.

Following section shows basic user auth using the api.  As of right now there is no support for token revocation or token expiration.

CREATE USER
-----------
`STATUS 201 CREATED`
from
`POST [domain]/users`

data:
```
"user": {
  "email": "testuser@gmail.com",
  "password": "atleast8chars"
}
```

sample response:
```
{
    "user": {
        "email": "testuser@gmail.com",
        "authentication_token": "GhBPRwKabKQX2wLzwU56"
    }
}
```

USER SIGN IN
------------
`STATUS 200 OK`
from
`POST [domain]/users/sign_in`

data:
```
{
  "user": {
    "email": "testuser@gmail.com",
    "password": "atleast8chars"
  }
}
```
sample response:
```
{
    "user": {
        "email": "testuser@gmail.com",
        "authentication_token": "GhBPRwKabKQX2wLzwU56"
    }
}
```

GET USERS LISTINGS
------------------
`STATUS 200 OK`
from
`GET [domain]/users/listings`

data:
```
  "auth_token": {
    "GhBPRwKabKQX2wLzwU56"
  }
```
sample response:
```
{
    "listings": [
        {
            "user_id": 2,
            "id": 2,
            "company_id": null,
            "contact_id": null,
            "job_title": null,
            "applied": false,
            "contact_email": null,
            "phone_number": null,
            "email": null,
            "posting_url": null,
            "created_at": "2015-03-07T13:21:12.592Z",
            "updated_at": "2015-03-07T13:21:12.592Z"
        },
        {
            "user_id": 2,
            "id": 3,
            "company_id": null,
            "contact_id": null,
            "job_title": null,
            "applied": false,
            "contact_email": null,
            "phone_number": null,
            "email": null,
            "posting_url": null,
            "created_at": "2015-03-07T13:26:20.245Z",
            "updated_at": "2015-03-07T13:26:20.245Z"
        }
    ]
}
```

GET ONE LISTING
`STATUS 200 OK`
from
`GET [domain]/users/listings/[:lid]`

data:
```
  "auth_token": {
    "GhBPRwKabKQX2wLzwU56"
  }
```

sample response
```
{
    "listing": {
        "user_id": 1,
        "id": 1,
        "company_id": 2,
        "contact_id": 3,
        "job_title": "Front End Engineer",
        "applied": false,
        "contact_email": "sergey@google.com",
        "phone_number": null,
        "email": "hr@google.com",
        "posting_url": "http://www.google.com/jobs/job/1234",
        "created_at": "2015-03-07T13:54:38.501Z",
        "updated_at": "2015-03-07T13:54:38.501Z"
    }
}
```