class Comment < ActiveRecord::Base
  belongs_to :blog_post
  belongs_to :user, inverse_of: :comments

  validates :body, :user, :blog_post, presence: true
end
