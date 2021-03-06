class User < ActiveRecord::Base

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "150x150" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	
	has_attached_file :id_scan, :styles => { :medium => "480x300>", :thumb => "240x150" }, :default_url => "/images/:style/missing_id_scan.png"
	validates_attachment_content_type :id_scan, :content_type => /\Aimage\/.*\Z/

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
