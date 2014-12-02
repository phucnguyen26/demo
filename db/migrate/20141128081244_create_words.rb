class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :english
      t.references :categorie, index: true

      t.timestamps
    end
  end
end
