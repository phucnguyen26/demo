class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :categorie
  has_many :lesson_words
end
