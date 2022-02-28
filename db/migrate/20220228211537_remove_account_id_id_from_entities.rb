class RemoveAccountIdIdFromEntities < ActiveRecord::Migration[6.1]
  def change
    remove_column :entities, :account_id_id
  end
end
