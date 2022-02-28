class EntitiesUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :entities_users do |t|
      t.column 'entity_id', :integer
      t.column 'user_id', :integer
    end
  end
end
