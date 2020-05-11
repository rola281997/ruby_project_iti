require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def test_the_truth 
    assert true
  end

  # this will cause failure since can not save category without name
  test "should not save category without name" do
    category = Category.new
    assert category.save
  end
end
