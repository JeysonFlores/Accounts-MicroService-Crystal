require "kemal"
require "mysql"
require "jwt"

exp = Time.utc.to_unix + 1500
SECRET_KEY = "ABCDEFGHIjKlMntY"

error 400 do 
  {error: "1", message: "Invalid request"}.to_json
end

error 403 do 
  {error: "1", message: "Unauthorized request"}.to_json
end

error 404 do
  {error: "1", message: "Invalid route"}.to_json
end

error 405 do 
  {error: "1", message: "Invalid method"}.to_json
end

post "/signup" do |env|
  response = {error: "0", message: "Sign up completed!"}.to_json
  env.response.content_type = "application/json"
  begin
    name = env.params.json["name"].as(String)
    email = env.params.json["email"].as(String)
    password = env.params.json["password"].as(String)
    DB.open "mysql://admin:password@localhost/accountsdb" do |db|
      db.exec "insert into user values (?, ?, ?, ?)",0 , name, email, password
    end
  rescue exception
    response = {error: "1", message: "Invalid data"}.to_json
    puts(exception)
  end
  response
end

get "/login" do |env|
  response = {error: "1", message: "Invalid data"}.to_json
  begin
    email = env.params.json["email"].as(String)
    password = env.params.json["password"].as(String)
    DB.open "mysql://admin:password@localhost/accountsdb" do |db|
      db.query "select id, email from user where email='#{email}' and password='#{password}'" do |rs|
       rs.each do 
         qid = rs.read(Int32)
         qemail = rs.read(String)
         payload = { "id" => qid, "email" => qemail, "exp" => exp }
         token = JWT.encode(payload, SECRET_KEY, JWT::Algorithm::HS256)
         response = {error: "0", token: token}.to_json
       end
      end
    end
  rescue exception
    response = {error: "1", message: "Invalid data"}.to_json
    puts(exception)
  end
  response
end

Kemal.config.port = 7777

Kemal.run
# --------------------------------------------------- Jeyson Antonio Flores Deras - Sept 2020 ----------------------------------------
