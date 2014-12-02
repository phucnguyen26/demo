class CategoriesController < ApplicationController
	def index
		@categories = Categorie.all
	end
end
