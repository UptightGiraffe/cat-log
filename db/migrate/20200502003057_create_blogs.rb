class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
