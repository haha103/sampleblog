class Board < ActiveRecord::Base
	has_many :posts
	has_many :comments, through: :posts
	belongs_to :moderator, class_name: "User", foreign_key: "moderator_id"
	belongs_to :category
end
