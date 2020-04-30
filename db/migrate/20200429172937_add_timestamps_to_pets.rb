class AddTimestampsToPets < ActiveRecord::Migration[6.0]
  def change

    add_column :pets, :created_at, :datetime # table name, column name, date type
    add_column :pets, :updated_at, :datetime

  end
end
