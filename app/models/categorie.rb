class Categorie < ActiveRecord::Base
	has_many :words
	has_many :lessons
end
