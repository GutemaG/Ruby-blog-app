require 'rails_helper'
RSpec.describe User, type: :model do
  it 'Should not save User with out name' do
    u = User.new
    expect(u.save).to be false
  end

  it 'Post counter must be Integer' do
    u = User.new
    u.name = 'Birhanu'
    u.posts_counter = 'test'
    expect(u.save).to be false
  end

  it 'Post Counter must be greater than or equal to 0' do
    u = User.new
    u.name = 'Birhanu'
    u.posts_counter = -1
    expect(u.save).to be false
  end

  it 'Should save with correct data' do
    u = User.new
    u.name = 'Birhanu'
    u.posts_counter = 10
    expect(u.save).to be true
  end

  it 'Should Return the correct Values' do
    name = 'Birhau'
    posts_counter = 10
    photo = 'http://photo.link'
    bio = 'He is student at microverse'
    u = User.new(name: name, posts_counter: posts_counter, photo: photo, bio: bio)
    expect(u.save).to be true
    u.save
    expect(u.name).to eq(name)
    expect(u.posts_counter).to eq(10)
    expect(u.bio).to eq(bio)
  end
end
