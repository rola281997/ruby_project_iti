require 'test_helper'

class BrandTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  # this will cause failure since can not save category without name
  test "should not save category without name" do
    category = Category.new
    assert !category.save
  end
end
