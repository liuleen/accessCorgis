class AddUserIdToCorgis < ActiveRecord::Migration[5.1]
  def change
    add_column :corgis, :user_id, :integer
  end
end
