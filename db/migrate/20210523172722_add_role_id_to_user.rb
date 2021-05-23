class AddRoleIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :role, foreign_key: {to_table: :roles}
  end
end
