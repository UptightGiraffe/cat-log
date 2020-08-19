require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "Sports")
  end

  test "category should be valid" do
    @category = Category.new(name: "Sports")
    assert @category.valid?
  end

  test "category should be present" do
    @category.name = ""
    assert_not @category.valid?
  end

  test "category should be unique" do
    @category.save
    @category = Category.new(name: "Sports")
    assert_not @category.valid?
  end

  test "name shoud not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end

  test "name shoud not be too short" do
    @category.name = "a" * 2
    assert_not @category.valid?
  end

end
