require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'Should not save User with out name' do
    u = User.new
    assert_not u.save
  end

  test 'Post counter must be Integer' do
    u = User.new
    u.name = 'Birhanu'
    u.posts_counter = 'test'
    assert_not u.save
  end

  test 'Post Counter must be greater than or equal to 0' do
    u = User.new
    u.name = 'Birhanu'
    u.posts_counter = -1
    assert_not u.save
  end

  test 'Should save with correct data' do
    u = User.new
    u.name = 'Birhanu'
    u.posts_counter = 10
    assert u.save
  end
end
