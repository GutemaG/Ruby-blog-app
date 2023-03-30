require 'rails_helper'
RSpec.describe Post, type: :model do
  it 'Should not save Post with out title' do
    p = Post.new
    expect(p.save).to be false
  end

  it 'Comment counter must be Integer and greater than or equal to 0' do
    u = User.new
    u.name = 'First post'
    u.posts_counter = 'test'
    expect(u.save).to be false
  end

  it 'Likes counter must be Integer and must be greater than or equal to 0' do
    p = Post.new
    p.title = 'First post'
    p.text = 'Post Body'
    p.likes_counter = -1
    expect(p.save).to be false
    p.comments_counter = -1
    expect(p.save).to be false
  end

  it 'Should save with correct data' do
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
    expect(p.save).to be true
  end

  it 'Should Return the correct Values' do
    title = 'First post'
    text = 'Post Body'
    likes_counter = 1
    comments_counter = 1

    u = User.new
    u.name = 'Birhanu'
    u.posts_counter = 1
    u.save

    p = Post.create(title: title, text: text, likes_counter: likes_counter, comments_counter: comments_counter,
                    author: u)
    expect(p.title).to eq(title)
    expect(p.likes_counter).to eq(1)
    expect(p.comments_counter).to eq(comments_counter)
    expect(p.author).to eq(u)
  end
end
