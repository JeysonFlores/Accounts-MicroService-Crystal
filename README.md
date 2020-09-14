# Accounts Microservice

  This microservice works by the Kemal Framework, uses MySQL as DBM (it doesn't have ORM... yet), encrypt the login data with JWT and receives and responds data       using JSON.
  
  <h1> [POST] Sign up </h3>
  <h2> POST /signup </h2>
  <h3> Format </h1>
  ```
  {
    "name": "Fernando Murrieta",
    "email": "Fernando@gmail.com",
    "password": "Fernando1234"
  }
```
  
  
  
  
  <h1> [GET] Log in </h3>
  <h2> [GET] /login </h2>
  <h3> Format </h1>
  ```
  {
    "email": "Fernando@gmail.com",
    "password": "Fernando1234"
  }
