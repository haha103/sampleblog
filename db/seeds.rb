# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

scale = 10

ActiveSupport::JSON.decode(File.read('db/seeds/users.json')).each do |d|
	User.create!(d)
end

1.upto(5) do |i|
	c = Category.new
	c.name = "测试分类 #{i}"
	c.save
end

1.upto(50) do |i|
	l = Label.new
	l.name = "测试标签 #{i}"
	l.save
end

1.upto(20) do |i|
	srand
	b = Board.new
	b.name = "测试板块 #{i}"
	b.moderator = User.find(rand(User.count) + 1)
	b.category = Category.find(rand(Category.count) + 1)
	b.labels = []
	b.labels += Label.all.sample(15)
	b.banner = "测试通告 #{i} ... "
	b.save
end

1.upto(100 * scale) do |i|
	srand
	p = Post.new
	p.title = "帖子标题 blablabla #{i}"
	p.content = "这是帖子内容 #{i} blablablabla"
	p.user = User.find(rand(User.count) + 1)
	p.board = Board.find(rand(Board.count) + 1)
	p.label = p.board.labels.sample
	p.save
end

1.upto(500 * scale) do |i|
	srand
	c = Comment.new
	c.post = Post.find(rand(Post.count) + 1)
	c.user = User.find(rand(User.count) + 1)
	c.content = "这是帖子回复 #{i} blablabla ..."
	c.parent = nil
	c.save
end

1.upto(1000 * scale) do |i|
	c = Comment.new
	c.parent = Comment.find(rand(Comment.count) + 1)
	c.post = c.parent.post
	c.user = User.find(rand(User.count) + 1)
	c.content = "这是回复评论\"#{c.parent.content}\"的评论 ..."
	c.save
end
