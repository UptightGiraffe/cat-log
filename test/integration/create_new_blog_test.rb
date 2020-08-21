require 'test_helper'

class CreateNewBlogTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(user_name: "Bao", email: "bao@email.com",
                              password: "password")
    sign_in_as(@user)
  end

  test 'can create a new blog' do
    get new_blog_path
    assert_response :success

    assert_difference 'Blog.count', 1 do
      post blogs_path, params: { blog: { title: "Bao is here", content: "hungry kitty", } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end
  
end
