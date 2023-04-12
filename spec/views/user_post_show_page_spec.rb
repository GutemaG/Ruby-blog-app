require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'test users show page', type: :feature do
  before(:each) do
    photo = 'https://unsplash.com/photos/wamrrABAEeM'
    @user = User.create(name: 'User1', photo: photo, bio: 'user 1 bio', posts_counter: 0)
    @user.save
    @post = Post.create(title: 'Post 1', text: 'Body of test 1', likes_counter: 0, comments_counter: 0,
                        author: @user)

    @comment1 = Comment.create(text: 'Comment 1 body', author: @user, post: @post)
    @comment2 = Comment.create(text: 'Comment 2 body', author: @user, post: @post)
    @comment3 = Comment.create(text: 'Comment 3 body', author: @user, post: @post)
    @like1 = Like.create(author: @user, post: @post)
    @like2 = Like.create(author: @user, post: @post)
    @like3 = Like.create(author: @user, post: @post)
    visit user_post_path(@post.author, @post)
  end

  it 'Shows the Post title' do
    expect(page).to have_content(@post.title)
  end

  it 'Shows the name of the author' do
    expect(page).to have_content(@post.author.name)
    expect(page).to have_content(@user.name)
  end

  it 'Shows the number of comments for the post' do
    expect(page).to have_content(@post.comments_counter)
  end

  it 'Shows the number of likes for the post ' do
    expect(page).to have_content(@post.likes_counter)
  end

  it 'Shows the body of the post' do
    expect(page).to have_content(@post.text)
  end

  it 'Shows the name of the commenter' do
    expect(page).to have_content(@comment1.author.name)
    expect(page).to have_content(@comment2.author.name)
    expect(page).to have_content(@comment3.author.name)
  end

  it 'Shows the body of the comment' do
    expect(page).to have_content(@comment1.text)
  end
end
