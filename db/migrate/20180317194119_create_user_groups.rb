class CreateUserGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :user_groups do |t|
      t.timestamps null: false
      t.timestamp :deleted_at
      t.references :created_by, references: :user, null: true
      t.references :updated_by, references: :user, null: true
      t.string :name, limit: "150"
    end

    create_table :user_groups_users do |t|
      t.references :user_group, index: true
      t.references :user, index: true
    end
  end
end
