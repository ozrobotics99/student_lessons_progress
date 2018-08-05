class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.integer :number
      t.integer :part_number
      t.integer :current_lesson

      t.timestamps
    end
  end
end
