class AddAccountIdEntities < ActiveRecord::Migration[6.1]
  add_column :entities, "account_id", "integer"
end
