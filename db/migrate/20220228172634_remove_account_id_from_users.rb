class RemoveAccountIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :account_id, :integer
  end
end
