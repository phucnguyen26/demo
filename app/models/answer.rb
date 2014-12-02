class Answer < ActiveRecord::Base
  belongs_to :word
  scope :correct, -> {where.not(id:nil).where(correct = true)}
end
