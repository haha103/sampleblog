class User < ActiveRecord::Base

	has_many :posts
	has_many :comments

	#has_many :boards
	
	def self.authenticate(nick, passwd)
		u = find_by_nick(nick)
		if u.passwd == passwd
			u
		else
			nil
		end
	end
end
