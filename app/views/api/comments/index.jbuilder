json.comments @comments do |comment|
  json.id    comment.id
  json.body comment.body
  json.user comment.user
  json.blog_post comment.blog_post
end