class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content
      t.boolean :correct
      t.references :word, index: true

      t.timestamps
    end
  end
end
