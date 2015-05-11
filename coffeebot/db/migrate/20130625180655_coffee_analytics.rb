class CoffeeAnalytics < ActiveRecord::Migration
  def up
    create_table :coffee_analytics do |t|
      t.column :brew_type, :string, :limit =>64, :null => false
      t.column :level, :float
      t.column :update_time, :timestamp, :null => false
    end
  end

  def down
    drop_table :coffee_analytics
  end
end
