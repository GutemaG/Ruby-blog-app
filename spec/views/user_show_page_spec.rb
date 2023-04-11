require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'test users show page', type: :feature do
  before(:each) do
    photo = 'https://unsplash.com/photos/wamrrABAEeM'
    @user = User.create(name: 'User1', photo: photo, bio: 'user 1 bio', posts_counter: 0)
    @user.save
    @post1 = Post.create(title: 'Post 1', text: 'Body of test 1', likes_counter: 0, comments_counter: 0,
                         author: @user)
    @post2 = Post.create(title: 'Post 2', text: 'Body of test 2', likes_counter: 0, comments_counter: 0,
                         author: @user)
    @post3 = Post.create(title: 'Post 3', text: 'Body of test 3', likes_counter: 0, comments_counter: 0,
                         author: @user)
    visit user_path(@user)
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

  it 'Show see the user bio' do
    expect(page).to have_content(@user.bio)
  end

  it 'Show the first 3 posts the user has written.' do
    expect(page).to have_content(@post1.text)
    expect(page).to have_content(@post2.text)
    expect(page).to have_content(@post3.text)
  end

  it 'Show button that lets me view all of a user' do
    expect(page).to have_content('See All Post')
  end

  it 'Redirect user post page(specfic post)' do
    link = find("a[href='#{user_post_path(@user, @post1)}']")
    link.click
    expect(page).to have_current_path(user_post_path(@user, @post1))
  end

  it 'Redirects to all posts' do
    link = find("a[href='#{user_posts_path(@user)}']")
    link.click
    expect(page).to have_current_path(user_posts_path(@user))
  end
end
