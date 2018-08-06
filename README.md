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

rake db:rollback
rails destroy scaffold course


#rake db:drop:_unsafe
#rake db:create
#rake db:migrate
#rake db:seed






rails generate scaffold teacher first_name:string last_name:string email:string

rails generate scaffold student first_name:string last_name:string email:string

rails generate scaffold enrolment student:references teacher:references


rails generate scaffold lesson number:integer part_number:integer current_lesson:integer

rails generate scaffold progress lesson:references student:references








http://localhost:3000/teachers

to show students per teacher

















