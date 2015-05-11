class CreateCoffeeAnalytics < ActiveRecord::Migration
  def change
    create_table :coffee_analytics do |t|

      t.timestamps
    end
  end
end
