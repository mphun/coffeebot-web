class Brews < ActiveRecord::Migration
  def up
    create_table :brews do |t|
      t.column :brew_type, :string, :limit =>64, :null => false
      t.column :level, :float
      t.column :filled_up, :integer, :default => 0
      t.column :filled_at, :timestamp, :null => false
      t.column :state, :enum, :limit => [:normal,:pumping,:removed]
    end
    add_index :brews, :brew_type, :unique => true
  end

  def down
    drop_table :brews
  end
end
