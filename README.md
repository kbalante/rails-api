# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

===============================
https://www.youtube.com/watch?v=k1HjmeqF0p0
===============================
rails new rails-api --api
uncomment rack-cors
bundle install --path vendor/bundle
cannot use alpine if using nokogiri
docker run -it rails-api
using docker-entrypoint to keep the container running by tailing /dev/null
docker run -it --name rails-api rails-api
change cors.rb initializer
rails g scaffold task summary:string description:text
rails s
http://localhost:3000/tasks
rails c
Task.create(summary:'create docker app', description:'create rails api application and dockerize it')

rails g scaffold User email:uniq password:digest
rails db:migrate

===============================
https://scottdomes.com/rails-authentication-deploy/
===============================

curl -X POST -H "Content-Type: application/json" -d @data.json http://localhost:3000/users
data.json
{
  "user": {
    "email": "test@test.com",
    "password": "13334"
  }
}
export TOKEN=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1OTIxNzkyNTAsImlzcyI6Imlzc3Vlcl9uYW1lIiwiYXVkIjoiY2xpZW50IiwidXNlcl9pZCI6N30.P9jWzMrXDFE235ChJrBgYvNZ3NVwxOfi5cfwdCLdAeI

curl -H 'Accept: application/json' -H "Authorization: Bearer ${TOKEN}" http://localhost:3000/users

# something to try
TOKEN=$(curl -s -X POST -H 'Accept: application/json' -H 'Content-Type: application/json' --data '{"username":"{username}","password":"{password}","rememberMe":false}' https://{hostname}/api/authenticate | jq -r '.id_token')


https://stackoverflow.com/questions/8555082/how-to-setup-a-one-to-many-relationship
rails g migration addUserIdToTasks

class AddUserIdToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :user_id, :integer
    add_index  :tasks, :user_id
  end
end

Task belongs_to User
User has_many_tasks

rails db:migrate
add a user association to a task

curl -H 'Accept: application/json' -H "Authorization: Bearer ${TOKEN}" http://localhost:3000/tasks