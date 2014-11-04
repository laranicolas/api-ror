# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
BlogPost.delete_all
Comment.delete_all

users = User.create([
	{
		email: "laranicolas@api.com",
		password: "nico1234",
		name: "Nicolas Lara"
	},
	{
		email: "rodrigopavano@api.com",
		password: "rodri1234",
		name: "Rodrigo Pavano"
	},
	{
		email: "victorquiroga@api.com",
		password: "victor1234",
		name: "Victor Quiroga"
	},
	{
		email: "matthewsalerno@api.com",
		password: "matt1234",
		name: "Matthew Salerno"
	}
])

blog_posts = BlogPost.create([
	{
		title: "First Blog Post",
		body: "wowwww my first blog post",
		user_id: users[0].id
	},
	{
		title: "Second Blog Post",
		body: "wowwww my second blog post",
		user_id: users[1].id
	},
	{
		title: "Third Blog Post",
		body: "wowwww my third blog post",
		user_id: users[2].id
	}
])

comments = Comment.create([
	{
		body: "Comment by Nico Lara",
		blog_post_id: blog_posts[0].id,
		user_id: users[0].id
	},
	{
		body: "Comment by Nico Lara",
		blog_post_id: blog_posts[1].id,
		user_id: users[0].id
	},
	{
		body: "Comment by Nico Lara",
		blog_post_id: blog_posts[2].id,
		user_id: users[0].id
	},
	{
		body: "Comment by Rodrigo Pavano",
		blog_post_id: blog_posts[0].id,
		user_id: users[1].id
	},
	{
		body: "Comment by Rodrigo Pavano",
		blog_post_id: blog_posts[1].id,
		user_id: users[1].id
	},
	{
		body: "Comment by Matthew Salerno",
		blog_post_id: blog_posts[0].id,
		user_id: users[3].id
	}
])
