require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'test users post index page', type: :feature do
  before(:each) do
    photo = 'https://unsplash.com/photos/wamrrABAEeM'
    @user = User.create(name: 'User1', photo: photo, bio: 'user bio', posts_counter: 0)
    @user.save
    @post1 = Post.create(title: 'Post 1', text: 'Body of test 1', likes_counter: 0, comments_counter: 0,
                         author: @user)
    @post2 = Post.create(title: 'Post 2', text: 'Body of test 2', likes_counter: 0, comments_counter: 0,
                         author: @user)
    @post3 = Post.create(title: 'Post 3', text: 'Body of test 3', likes_counter: 0, comments_counter: 0,
                         author: @user)
    @comment1 = Comment.create(text: 'Comment 1 body', author: @user, post: @post1)
    @comment2 = Comment.create(text: 'Comment 2 body', author: @user, post: @post2)
    @comment3 = Comment.create(text: 'Comment 3 body', author: @user, post: @post3)
    @like1 = Like.create(author: @user, post: @post1)
    @like2 = Like.create(author: @user, post: @post1)
    @like3 = Like.create(author: @user, post: @post2)

    visit user_posts_path(@user)
  end

  it 'Show user profile picture' do
    expect(page).to have_selector("img[src*='#{@user.photo}']")
  end

  it 'Show the user name' do
    expect(page).to have_content(@user.name)
  end

  it 'shows the number of posts user has written' do
    expect(page).to have_content(@user.posts_counter)
  end

  it 'Shows the Post titles' do
    expect(page).to have_content(@post1.title)
    expect(page).to have_content(@post2.title)
    expect(page).to have_content(@post3.title)
  end

  it 'Shows the Post content' do
    expect(page).to have_content(@post1.text)
    expect(page).to have_content(@post2.text)
    expect(page).to have_content(@post3.text)
  end

  it 'Shows the posts comments' do
    expect(page).to have_content(@comment1.text)
    expect(page).to have_content(@comment2.text)
    expect(page).to have_content(@comment3.text)
  end

  it 'Shows the number of comments for each post' do
    expect(page).to have_content(@post1.comments_counter)
    expect(page).to have_content(@post2.comments_counter)
    expect(page).to have_content(@post3.comments_counter)
  end

  it 'Shows the number of likes on each post' do
    expect(page).to have_content(@post1.likes_counter)
    expect(page).to have_content(@post2.likes_counter)
    expect(page).to have_content(@post3.likes_counter)
  end

  it 'shows a button for pagination' do
    expect(page).to have_content('Pagination')
  end

  it 'Redirect user post page(specfic post)' do
    link = find("a[href='#{user_post_path(@user, @post1)}']")
    link.click
    expect(page).to have_current_path(user_post_path(@user, @post1))
  end
end
