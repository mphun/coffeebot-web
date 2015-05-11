class Users < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.column :firstname, :string, :limit =>128, :null => false
      t.column :lastname, :string, :limit => 128, :null => false
      t.column :email, :string
      t.column :phone_number, :string
    end
  end

  def down
    drop_table :users
  end
end
