class CreateInitialTables < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :status
      t.timestamps
    end

    create_table :roles do |t|
      t.string :name
      t.timestamps
    end

    create_table :permissions do |t|
      t.string :name
      t.belongs_to :role, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end

  end
  def self.down
  end

  end


roles have many permissions
users have many permissions
users have only one roles

end
