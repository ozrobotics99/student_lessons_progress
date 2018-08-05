json.extract! lesson, :id, :number, :part_number, :current_lesson, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
