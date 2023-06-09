class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_post_counter

  def update_post_counter
    post.update(likes_counter: post.likes.count)
  end
end
