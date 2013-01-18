class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :api_user_id
      t.string :first_name
      t.string :last_name
      t.integer :points
      t.integer :points_last_week
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
