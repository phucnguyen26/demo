class WordsController < ApplicationController
	def index
		@words = Word.all
		@categories = Categorie.all

    	@filter = params[:filter_word] ? params[:filter_word] : "all"
    	if @filter == "learned"
      		@words = Word.learned current_user.id, params[:category_id]
    	elsif @filter == "not learned"
      		@words = Word.not_learned current_user.id, params[:category_id]
    	else
      		if !params[:category_id].blank?
        		@current_category = Category.find params[:category_id]
        		@words = @current_category.words
      			else
        			@words = Word.all
      		end
    		end
  		end
	
end
