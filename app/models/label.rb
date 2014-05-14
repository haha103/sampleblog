class Label < ActiveRecord::Base
	has_and_belongs_to_many :boards
	has_many :posts
end
