# README

Installation:

    Ruby version:
        ruby '2.4.4'

    Install gems:
        bundle install

    Database creation:
        rake db:create
        rake db:migrate
        rake db:seed


    Run application:
        rails s

* How to run the test suite




Usefull links (ids may differ) :


    List of teachers and classes
        http://localhost:3000/teachers

    Specific teachers report:
        http://localhost:3000/students_class/18

    each student:
        http://localhost:3000/students/25

    json student:
        http://localhost:3000/students/25.json













rails generate scaffold teacher first_name:string last_name:string email:string

rails generate scaffold student first_name:string last_name:string email:string

rails generate scaffold enrolment student:references teacher:references


rails generate scaffold lesson number:integer part_number:integer current_lesson:integer

rails generate scaffold progress lesson:references student:references




















