User.create(name: "The Undertaker")
User.create(name: "Scott Hall")
User.create(name: "Kevin Nash")

Post.create(title: "Post1", content: "Content1")
Post.create(title: "Post2", content: "Content2")

# Post1 Authors
UserPost.create(user_id: 1, post_id: 1)
UserPost.create(user_id: 2, post_id: 1)

# Post2 Authors
UserPost.create(user_id: 2, post_id: 2)
UserPost.create(user_id: 3, post_id: 2)
