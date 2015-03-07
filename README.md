
README
======
Lets try and get these right this time, right Dane?!?


Important - Domain `https://interviewtracker-api.herokuapp.com`

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
