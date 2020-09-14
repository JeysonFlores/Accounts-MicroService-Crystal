# Accounts Microservice

  This microservice works by the Kemal Framework, uses MySQL as DBM (it doesn't have ORM... yet), encrypt the login data with JWT and receives and responds data       using JSON.
  
  <h2> [POST]   /signup </h3>
  <h3> Request format </h1>
  
  ```
  {
    "name": "Fernando Murrieta",
    "email": "Fernando@gmail.com",
    "password": "Fernando1234"
  }
```
  
  
  
  
  <h2> [GET]   /login </h3>
  <h3> Request format </h1>
  
  ```
  {
    "email": "Fernando@gmail.com",
    "password": "Fernando1234"
  }
```
  **Note:** after each login, it returns a JSON object with the authentication token which will last 1 hour.

  <h3> Error Handlers </h3>
 
  -  400 Bad Request
  -  403 Forbidden
  -  404 Not Found
  -  405 Method Not Allowed
  
  
# Resources

  - MySQL / MariaDB

# Crystal Dependences (shards)

 - crystal-mysql
 - jwt
 - kemal (branch master)


