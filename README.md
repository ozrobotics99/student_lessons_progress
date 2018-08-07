# README

###Installation###

    Ruby version:
        ruby '2.4.4'

    Install gems:
        bundle install

    Database creation:
        rake db:create && rake db:migrate && rake db:seed

    Run application:
        rails s


###How to run the tests###

        rake db:migrate RAILS_ENV=test

        #all tests
        bundle exec rspec spec

        #individual tests
        bundle exec rspec spec/controllers/students_controller_spec.rb
        bundle exec rspec spec/controllers/teachers_controller_spec.rb
        bundle exec rspec spec/controllers/lessons_controller_spec.rb
        bundle exec rspec spec/controllers/progresses_controller_spec.rb
        bundle exec rspec spec/controllers/enrolments_controller_spec.rb

        bundle exec rspec spec/models/student_model_spec.rb
        bundle exec rspec spec/models/teacher_model_spec.rb
        bundle exec rspec spec/models/lesson_model_spec.rb


###Useful links (ids may differ)###

    List of teachers and classes
        http://localhost:3000/teachers

    Specific teachers report:
        http://localhost:3000/students_class/18

    each student:
        http://localhost:3000/students/25

    json student:
        http://localhost:3000/students/25.json


Problems:

    factory_girl gem is deprecated warning, I couldn't get it to work.


TO DO:

    more spec tests progress, enrolments
    set up data with factory girl

    change the template to reflect nicer graphic design

    fix rubocop errors




###scaffolds###

    rails generate scaffold teacher first_name:string last_name:string email:string

    rails generate scaffold student first_name:string last_name:string email:string

    rails generate scaffold enrolment student:references teacher:references


    rails generate scaffold lesson number:integer part_number:integer current_lesson:integer

    rails generate scaffold progress lesson:references student:references



USEFULL commands:

    rake db:drop:_unsafe

    gem uninstall -aIx












