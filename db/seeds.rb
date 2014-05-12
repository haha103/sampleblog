# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveSupport::JSON.decode(File.read('db/seeds/users.json')).each do |d|
	User.create!(d)
end

1.upto(100) do |i|
	srand
	Post.create(title: "帖子标题 blablabla #{i}", content: "这是帖子内容 #{i} blablablabla", user: User.find(rand(User.count) + 1))
end

1.upto(500) do |i|
	srand
	c = Comment.new
	c.post = Post.find(rand(Post.count) + 1)
	c.user = User.find(rand(User.count) + 1)
	c.content = "这是帖子回复 #{i} blablabla ..."
	c.parent = nil
	c.save
end

1.upto(1000) do |i|
	c = Comment.new
	c.parent = Comment.find(rand(Comment.count) + 1)
	c.post = c.parent.post
	c.user = User.find(rand(User.count) + 1)
	c.content = "这是回复评论\"#{c.parent.content}\"的评论 ..."
	c.save
end
