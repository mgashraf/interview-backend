
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
  "email": "macho_man_alan_matthews@gmail.com",
  "password": "nachooooescheese"
}
```

sample response:
```
{
    "user": {
        "email": "macho_man_alan_matthews@gmail.com",
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
    "email": "macho_man_alan_matthews@gmail.com",
    "password": "nachooooescheese"
  }
}
```
sample response:
```
{
    "user": {
        "email": "macho_man_alan_matthews@gmail.com",
        "authentication_token": "GhBPRwKabKQX2wLzwU56"
    }
}
```
