# Sample Rails 5 API only App

This sample app allow user to login/signup and manage their friends usinf REST API call

##List of APIs

###Signup
[POST] `https://protected-falls-46969.herokuapp.com/users`

#### Example Request
```shell
curl -X POST -H "Content-Type: application/json" 
-d '{"user":{"first_name":"Nilay","password":"12345678","last_name":"Anand", "email":"nilayanand@gmail.com"}}' 
"http://localhost:3000/users"
```

#### Response
```json
{
  "success": true,
  "message": "User created successfully",
  "data": {
    "auth_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2LCJpYXQiOiIyMDE3LTAyLTA2IDA4OjAwOjUwIFVUQyJ9.RC8MMSeHpKlYM4XOO_aS1XVNj_avfgNCdq95AACtuSc",
    "user": {
      "id": 6,
      "first_name": "Nilay",
      "last_name": "Anand",
      "email": "nilayanand4@gmail.com"
    }
  }
}
```

### Login
[POST] `https://protected-falls-46969.herokuapp.com/sessions`

#### Example Request
```shell
curl -X POST -H "Content-Type: application/json" 
-d '{"email":"nilayanand@gmail.com", "password":"root1234"}' 
"https://protected-falls-46969.herokuapp.com/sessions"
```

#### Response
```json
{
  "success": true,
  "message": "Logged in successfully",
  "data": {
    "auth_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJpYXQiOiIyMDE3LTAyLTA2IDA4OjA1OjAzIFVUQyJ9.Z1RYjF3QaKIfah1dgxvZzYLKfhUQm_DI0XJ0oVDqoEE",
    "user": {
      "id": 1,
      "first_name": "Nilay",
      "last_name": "Anand",
      "email": "nilayanand@gmail.com"
    }
  }
}
```

After obtaining "auth_token" using login/signup API, this value will be used in all subsequent API call under HTTP header 'auth_token' variable

### Friend list
[GET] `https://protected-falls-46969.herokuapp.com/friends`

#### Example Request
```shell
curl -X GET -H "auth_token: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJpYXQiOiIyMDE3LTAyLTA2IDA3OjIzOjI3IFVUQyJ9.QIy4gup4RDF4v_gGJqJvRxU0QCR12XY3gfniJ-zyP7E" 
"https://protected-falls-46969.herokuapp.com/friends"

```

#### Response
```json
{
  "success": true,
  "message": null,
  "data": {
    "count": 1,
    "friends": [
      {
        "id": 1,
        "first_name": "Bebo",
        "last_name": "Anand",
        "email": "bebo@devzila.com"
      }
    ]
  }
}
```

### Add Friend
[POST] `https://protected-falls-46969.herokuapp.com/friends`

#### Example Request
```shell
curl -X GET -H "auth_token: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJpYXQiOiIyMDE3LTAyLTA2IDA3OjIzOjI3IFVUQyJ9.QIy4gup4RDF4v_gGJqJvRxU0QCR12XY3gfniJ-zyP7E" 
-d '{"first_name":"Karishma", "last_name": "Anand", "email": "karishma@devzila.com"}'
"https://protected-falls-46969.herokuapp.com/friends"

```

#### Response
```json
{
  "success": true,
  "message": "Friend created successfully",
  "data": {
    "friend": {
      "id": 2,
      "first_name": "Karishma",
      "last_name": "Anand",
      "email": "karishma@devzila.com"
    }
  }
}
```


### Update Friend
[PUT] `https://protected-falls-46969.herokuapp.com/friends/<friend_id>`

#### Example Request
```shell
curl -X GET -H "auth_token: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJpYXQiOiIyMDE3LTAyLTA2IDA3OjIzOjI3IFVUQyJ9.QIy4gup4RDF4v_gGJqJvRxU0QCR12XY3gfniJ-zyP7E" 
-d '{"first_name":"Karishma", "last_name": "Anand", "email": "karishma@devzila.com"}'
"https://protected-falls-46969.herokuapp.com/friends/1"

```

#### Response
```json
{
  "success": true,
  "message": "Friend updated successfully",
  "data": {
    "friend": {
      "id": 1,
      "first_name": "Karishma",
      "last_name": "Anand",
      "email": "karishma1@devzila.com"
    }
  }
}
```

### Delete Friend
[DELETE] `https://protected-falls-46969.herokuapp.com/friends/<friend_id>`

#### Example Request
```shell
curl -X GET -H "auth_token: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJpYXQiOiIyMDE3LTAyLTA2IDA3OjIzOjI3IFVUQyJ9.QIy4gup4RDF4v_gGJqJvRxU0QCR12XY3gfniJ-zyP7E" 
"https://protected-falls-46969.herokuapp.com/friends/1"

```

#### Response
```json
{
  "success": true,
  "message": null,
  "data": {
    "message": "Friend deleted successfully"
  }
}
```