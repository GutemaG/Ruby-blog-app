require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Hello world', type: :feature do
  before(:each) do
    photo = 'https://unsplash.com/photos/wamrrABAEeM'
    @user1 = User.create(name: 'User1', photo: photo, bio: 'user 1 bio', posts_counter: 0)
    @user1.save
    @user2 = User.create(name: 'User2', photo: photo, bio: 'user 1 bio', posts_counter: 0)
    @user2.save
    visit users_path
  end
  it 'shows the right user name' do
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
  end

  it 'Show the profile picture of user' do
    expect(page).to have_selector("img[src*='#{@user1.photo}']")
  end

  it 'shows the number of Post counter for each user' do
    expect(page).to have_content(@user1.posts_counter)
    expect(page).to have_content(@user2.posts_counter)
  end

  it 'Redirect user to correct user page' do
    link = find("a[href='#{user_path(@user1)}']")
    link.click
    expect(page).to have_current_path(user_path(@user1))
  end
end
