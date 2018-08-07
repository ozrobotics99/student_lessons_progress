# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#delete table data
Progress.delete_all
Enrolment.delete_all
Lesson.delete_all
Student.delete_all
Teacher.delete_all

t1 = Teacher.create!(:first_name => 'Bob', :last_name => 'Hake')
t2 = Teacher.create!(:first_name => 'Andrew', :last_name => 'Bogut')
puts 'Teachers Created.'

s1 = Student.create!(:first_name => 'Mario', :last_name => 'Gomez')
s2 = Student.create!(:first_name => 'Damir', :last_name => 'Djokic')
s3 = Student.create!(:first_name => 'Davor', :last_name => 'Suker')
s4 = Student.create!(:first_name => 'Luka', :last_name => 'Modric')
puts 'Students Created.'

Enrolment.create!(:student => s1, :teacher => t1 )
Enrolment.create!(:student => s2, :teacher => t1 )
Enrolment.create!(:student => s3, :teacher => t1 )
Enrolment.create!(:student => s4, :teacher => t1 )
puts 'Enrolments Created.'

#change to allow extra lessons true or false
EXTRA_LESSONS = true
MAX_LESSONS = 100
FIRST_50 = 50
FIRST_50_PARTS = 5
MAX_PARTS = 3

def create_lessons

  lesson = 1
  part = 1

  if EXTRA_LESSONS == true
    puts 'Creating Extra Lessons...'
    max_l = FIRST_50
    max_p = FIRST_50_PARTS
    loop_create_lessons(lesson, max_l, part, max_p)

    lesson = 51
    max_l = MAX_LESSONS
    max_p = MAX_PARTS
    loop_create_lessons(lesson, max_l, part, max_p)
  else
    puts 'Creating Normal Lessons...'
    max_l = MAX_LESSONS
    max_p = MAX_PARTS
    loop_create_lessons(lesson, max_l, part, max_p)
  end
  puts 'Lessons Created.'
end

def loop_create_lessons(lesson, max_l, part, max_p)
  while lesson <= max_l  do
    part = 1
    while part <= max_p do
      Lesson.create!(:number => lesson, :part_number => part)
      #puts "Created lesson #{lesson}, part #{part} "
      part += 1
    end
    lesson += 1
  end
end

create_lessons()


