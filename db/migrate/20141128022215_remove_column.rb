class RemoveColumn < ActiveRecord::Migration
  def up
    #remove_column :answers, :wrong_content
  end
  def self.down
    #add_column :answers, :content, :string
    #add_column :answers, :correct, :boolean
    #add_column :answers, :word_id, :integer
  end
end
