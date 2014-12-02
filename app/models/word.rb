class Word < ActiveRecord::Base
  belongs_to :categorie
  has_many :answers
  has_one :lesson_word
  
  scope :learned, ->(current_user_id, current_categorie_id){
 learned_word_ids = LessonWord.select("word_id").where(lesson_id: Lesson.select("id").where(user_id: current_user_id)).to_sql
    if current_categorie_id != ""
      where("id IN (#{learned_word_ids}) AND categorie_id = :current_categorie_id ", current_categorie_id: current_categorie_id)
    else
      where("id IN (#{learned_word_ids})")
    end
  }
  
  scope :not_learned, ->(current_user_id, current_categorie_id){
  learned_word_ids = LessonWord.select("word_id").where(lesson_id: Lesson.select("id").where(user_id: current_user_id)).to_sql
    
    if current_categorie_id != ""
      where("id NOT IN (#{learned_word_ids}) AND categorie_id = :current_categorie_id ",
       current_categorie_id: current_categorie_id)
    else
      where("id NOT IN (#{learned_word_ids})")
    end
  }
end
