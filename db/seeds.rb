# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

1.upto(10) do |i|
	User.create({ nick: "user #{i} nick", name: "user #{i}", passwd: "user #{i} passwd" })
end

1.upto(10) do |i|
	Post.create(title: "title #{i}", content: "content #{i}", user: User.find(i))
end

1.upto(10) do |i|
	c = Comment.new
	c.post = Post.find(3)
	c.user = User.find(i)
	c.content = "content #{i}"
	c.parent = i == 1 ? nil : Comment.find(i - 1)
	c.save
end
