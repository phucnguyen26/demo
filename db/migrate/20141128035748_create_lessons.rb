class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.references :user, index: true
      t.references :categorie, index: true

      t.timestamps
    end
  end
end
