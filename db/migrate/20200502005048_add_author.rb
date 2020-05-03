class AddAuthor < ActiveRecord::Migration[6.0]
  def change

    add_column :blogs, :author, :text

  end
end
