class CreateInitialTables < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :status
      t.timestamps
    end

    create_table :roles do |t|
      t.string :name
      t.belongs_to :user, index: { unique: true }, foreign_key: true
      t.timestamps
    end

    create_table :permissions do |t|
      t.string :name
      t.belongs_to :role, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end

  end
end
