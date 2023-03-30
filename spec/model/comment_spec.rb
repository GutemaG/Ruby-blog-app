require 'rails_helper'
RSpec.describe Comment, type: :model do
  it 'Should save with correct data and Return the correct value' do
    u = User.new
    u.name = 'Birhanu'
    u.posts_counter = 1
    u.save

    p = Post.new
    p.title = 'First post'
    p.text = 'Post Body'
    p.likes_counter = 1
    p.comments_counter = 1
    p.author = u
    p.save

    c = Comment.new
    c.text = 'Comment body for testing'
    c.author = u
    c.post = p
    c.save
    expect(c.author).to eq(u)
    expect(c.post).to eq(p)
  end
end
