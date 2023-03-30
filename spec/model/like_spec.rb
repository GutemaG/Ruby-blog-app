require 'rails_helper'
RSpec.describe Like, type: :model do
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

    l = Comment.new
    l.author = u
    l.post = p
    l.save
    expect(l.author).to eq(u)
    expect(l.post).to eq(p)
  end
end
