
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
            "posting_url": null,
            "created_at": "2015-03-07T13:21:12.592Z",
            "updated_at": "2015-03-07T13:21:12.592Z",
            "submitted_resume": false,
            "date_resume_submitted": null,
            "opportunity_ranking": 4,
            "opportunity_description": "Great small hot new social web startup",
            "company_summary": "the owner mark seems like a nice guy, they like likes.",
            "lead_source": "Was referred by CTO, forgot his name :("
        },
        {
            "user_id": 2,
            "id": 3,
            "job_title": null,
            "applied": false,
            "contact_email": null,
            "phone_number": null,
            "posting_url": null,
            "created_at": "2015-03-07T13:26:20.245Z",
            "updated_at": "2015-03-07T13:26:20.245Z",
            "submitted_resume": false,
            "date_resume_submitted": null,
            "opportunity_ranking": 4,
            "opportunity_description": "Great small hot new social web startup",
            "company_summary": "the owner mark seems like a nice guy, they like likes.",
            "lead_source": "Was referred by CTO, forgot his name :("
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
        "job_title": "Front End Engineer",
        "applied": false,
        "contact_email": "sergey@google.com",
        "phone_number": null,
        "posting_url": "http://www.google.com/jobs/job/1234",
        "created_at": "2015-03-07T13:54:38.501Z",
        "updated_at": "2015-03-07T13:54:38.501Z",
        "submitted_resume": false,
        "date_resume_submitted": null,
        "opportunity_ranking": 4,
        "opportunity_description": "Great small hot new social web startup",
        "company_summary": "the owner mark seems like a nice guy, they like likes.",
        "lead_source": "Was referred by CTO, forgot his name :("
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
        "job_title": "Front End Engineer",
        "applied": false,
        "contact_email": "sergey@google.com",
        "phone_number": null,
        "email": "hr@google.com",
        "posting_url": "http://www.google.com/jobs/job/1234",
        "submitted_resume": false,
        "date_resume_submitted": null,
        "opportunity_ranking": 4,
        "opportunity_description": "Great small hot new social web startup",
        "company_summary": "the owner mark seems like a nice guy, they like likes.",
        "lead_source": "Was referred by CTO, forgot his name :("
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
        "posting_url": "http://www.google.com/jobs/job/1234",
        "created_at": "2015-03-07T13:54:38.501Z",
        "updated_at": "2015-03-07T14:47:41.935Z"
        "submitted_resume": false,
        "date_resume_submitted": null,
        "opportunity_ranking": 4,
        "opportunity_description": "Great small hot new social web startup",
        "company_summary": "the owner mark seems like a nice guy, they like likes.",
        "lead_source": "Was referred by CTO, forgot his name :("
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
        "job_title": "Junior Ruby Developer",
        "applied": false,
        "contact_email": "hr@facebook.com,
        "phone_number": "18005556677,
        "posting_url": "https://www.facebook.com/jobs/234",
        "company_name": "Facebook",
        "notes": null,
        "submitted_resume": false,
        "date_resume_submitted": null,
        "opportunity_ranking": 4,
        "opportunity_description": "Great small hot new social web startup",
        "company_summary": "the owner mark seems like a nice guy, they like likes.",
        "lead_source": "Was referred by CTO, forgot his name :("
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
        "posting_url": "https://www.facebook.com/jobs/234",
        "created_at": "2015-03-07T18:37:30.543Z",
        "updated_at": "2015-03-07T18:37:30.543Z",
        "interview_id": null,
        "company_name": "Facebook",
        "notes": null,
        "submitted_resume": false,
        "date_resume_submitted": null,
        "opportunity_ranking": 4,
        "opportunity_description": "Great small hot new social web startup",
        "company_summary": "the owner mark seems like a nice guy, they like likes.",
        "lead_source": "Was referred by CTO, forgot his name :("
    }
}
```

DELETE A LISTING
----------------
`STATUS 200 OK`
from
`DELETE [domain]/users/listings/[:lid]`

data:
Provide `auth_token` in header

sample response
```
{
    "message": "Listing successfully deleted"
}
```

POST AN INTERVIEW
-----------------
`STATUS 201 CREATED`
from
`POST [domain]/users/listings/[:lid]/intervews`

data:
```
{
    "interview": {
        "follow_up_email": null,
        "interview_time": null,
        "interviewtype": null,
        "interviewed": false,
        "notes": null,
        "status": null
    }
}
```

response:
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
        "posting_url": "https://www.facebook.com/jobs/234",
        "created_at": "2015-03-07T18:37:30.543Z",
        "updated_at": "2015-03-07T18:37:30.543Z",
        "interview_id": null,
        "company_name": "Facebook",
        "notes": null,
        "submitted_resume": false,
        "date_resume_submitted": null,
        "opportunity_ranking": 4,
        "opportunity_description": "Great small hot new social web startup",
        "company_summary": "the owner mark seems like a nice guy, they like likes.",
        "lead_source": "Was referred by CTO, forgot his name :("
    }
}
```

GET USER PROFILE
-----------------
`STATUS 200 OK`
from
`GET [domain]/user`

data:
just `auth_token` in header

response:
```
{
    "user": {
        "id": 2,
        "email": "t@gmail.com",
        "full_name": "dylan dechant",
        "age": 28,
        "experience": "things",
        "skills": "sleeeping",
        "education": "school"
    }
}
```


EDIT USER PROFILE
-----------------
`STATUS 200 OK`
from
`PATCH [domain]/user`

data:
`auth_token` in header, body:
```
{
    "user": {
        "full_name": "dylan dechant",
        "age": 28,
        "experience": "things",
        "skills": "sleeeping",
        "education": "school"
    }
}
```

response:
```
{
    "user": {
        "id": 2,
        "email": "t@gmail.com",
        "full_name": "dylan dechant",
        "age": 28,
        "experience": "things",
        "skills": "sleeeping",
        "education": "school"
    }
}
```
