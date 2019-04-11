class AddUserIdToJerseys < ActiveRecord::Migration[5.2]
  def change
    add_column :jerseys, :user_id, :integer
  end
end
