class User < ActiveRecord::Base

	has_many :posts
	has_many :comments
	
	def self.authenticate(nick, passwd)
		u = find_by_nick(nick)
		if u.passwd == passwd
			u
		else
			nil
		end
	end
end
