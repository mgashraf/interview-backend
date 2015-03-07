
README
======
Lets try and get these right this time, right Dane?!?



Important - Domain `https://interviewtracker-api.herokuapp.com`
NOTE: can pass `auth_token` in Header data

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
---------------
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

EDIT LISTING
-------------
`STATUS 200 OK`
from
`PATCH [domain]/users/listings/[:lid]`

data:
```
{
    "listing": {
        "company_id": 2,
        "contact_id": 3,
        "job_title": "Front End Engineer",
        "applied": false,
        "contact_email": "sergey@google.com",
        "phone_number": null,
        "email": "hr@google.com",
        "posting_url": "http://www.google.com/jobs/job/1234"
    }
}
```


response:
```
{
    "listing": {
        "user_id": 1,
        "id": 1,
        "company_id": 2,
        "contact_id": 2,
        "job_title": "Engineer",
        "applied": false,
        "contact_email": "hr@facebook.com",
        "phone_number": null,
        "email": "hr@google.com",
        "posting_url": "http://www.google.com/jobs/job/1234",
        "created_at": "2015-03-07T13:54:38.501Z",
        "updated_at": "2015-03-07T14:47:41.935Z"
    }
}
```

POST A LISTING
--------------
`STATUS 201 CREATED`
from
`POST [domain]/users/listings`

data
```
{
    "listing": {
        "job_title": "Junior Ruby Developer,
        "applied": false,
        "contact_email": "hr@facebook.com,
        "phone_number": "18005556677,
        "email": "hr@facebook.com",
        "posting_url": "https://www.facebook.com/jobs/234",
        "interview_id": null,
        "company_name": "Facebook",
        "notes": null
    }
}
```

response
```
{
    "listing": {
        "id": 2,
        "user_id": 1,
        "contact_id": null,
        "job_title": "Junior Ruby Developer",
        "applied": false,
        "contact_email": "hr@facebook.com",
        "phone_number": "18005556677",
        "email": "hr@facebook.com",
        "posting_url": "https://www.facebook.com/jobs/234",
        "created_at": "2015-03-07T18:37:30.543Z",
        "updated_at": "2015-03-07T18:37:30.543Z",
        "interview_id": null,
        "company_name": "Facebook",
        "notes": null
    }
}
```