class Board < ActiveRecord::Base
	has_many :posts
	belongs_to :moderator, class_name: "User", foreign_key: "moderator_id"
end