class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.timestamps null: false
      t.timestamp :deleted_at
      t.string :name, limit: "150"
      t.string :verb, limit: "150"
      t.string :noun, limit: "150"
    end

    create_table :permissions_user_groups do |t|
      t.references :permission, index: true
      t.references :user_group, index: true
    end
  end
end
