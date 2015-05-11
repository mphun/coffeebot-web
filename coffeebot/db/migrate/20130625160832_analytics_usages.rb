class AnalyticsUsages < ActiveRecord::Migration
  def up
    create_table :analytics_usages do |t|
      t.column :user_id, :integer
      t.column :username, :string, :limit =>128, :null => false
      t.column :coffee_brew_type, :string, :limit =>64, :null => false
      t.column :level, :float
      t.column :percent_used, :float
      t.column :age, :timestamp, :null => false
    end
  end

  def down
    drop_table :analytics_usages
  end
end
