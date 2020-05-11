require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end

  test 'valid user' do
    user = User.new(email: 'john@example.com' , encrypted_password: 'passw0rd', username: 'John', role: 'seller')
    assert !user.valid?
  end

  # test 'invalid without name' do
  # end

  test 'invalid without email' do
    user = User.new(username: 'John', encrypted_password: 'passw0rd')
    assert_not_nil user.errors[:email]
  end
end
