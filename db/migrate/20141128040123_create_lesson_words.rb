class CreateLessonWords < ActiveRecord::Migration
  def change
    create_table :lesson_words do |t|
      t.references :word, index: true
      t.references :answer, index: true
      t.references :lesson, index: true

      t.timestamps
    end
  end
end
