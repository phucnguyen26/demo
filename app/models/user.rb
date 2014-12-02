class User < ActiveRecord::Base
attr_accessor :not_validate_password
before_save   :downcase_email
validates :name,  presence: true, :uniqueness=>true, length: { maximum: 50 }

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, length: { maximum: 255 },
                    				  format: { with: VALID_EMAIL_REGEX },
                    				  uniqueness: { case_sensitive: false }
has_secure_password
validates :password, length: { minimum: 6 }, 
                              allow_blank: true, confirmation: true,
                              unless: :not_validate_password
validates :password_confirmation, length: { minimum: 6 }, 
                              allow_blank: true

has_many :lessons
has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

has_many :following, through: :active_relationships, source: :followed
has_many :followers, through: :passive_relationships, source: :follower

    def downcase_email
      self.email = email.downcase
  	end

  	def User.new_token
      SecureRandom.urlsafe_base64
  	end

  	def follow(other_user)
      active_relationships.create(followed_id: other_user.id)
    end
    def unfollow(other_user)
      active_relationships.find_by(followed_id: other_user.id).destroy
    end
    def following?(other_user)
      following.include?(other_user)
    end
end
