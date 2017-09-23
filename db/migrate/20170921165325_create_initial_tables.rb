class CreateInitialTables < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :status
      t.belongs_to :role
      t.timestamps
    end

    create_table :roles do |t|
      t.string :name
      t.timestamps
    end

    create_table :permissions do |t|
      t.string :name
      t.timestamps
    end

    create_table :permissions_roles, id: false do |t|
      t.belongs_to :role, index: true
      t.belongs_to :permission, index: true
    end

    create_table :permissions_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :permission, index: true
    end
  end
end
