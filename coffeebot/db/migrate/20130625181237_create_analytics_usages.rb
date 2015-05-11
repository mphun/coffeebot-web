class CreateAnalyticsUsages < ActiveRecord::Migration
  def change
    create_table :analytics_usages do |t|

      t.timestamps
    end
  end
end
