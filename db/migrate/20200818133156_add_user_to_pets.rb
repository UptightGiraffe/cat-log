class AddUserToPets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :user_id, :int
  end
end
