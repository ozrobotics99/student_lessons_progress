class CreateProgresses < ActiveRecord::Migration[5.2]
  def change
    create_table :progresses do |t|
      t.references :lesson, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
