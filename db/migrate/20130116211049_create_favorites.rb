class CreateFavorites < ActiveRecord::Migration
  def self.up
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :team_id
      t.integer :current_points
      t.integer :last_week_points
      t.timestamps
    end
  end

  def self.down
    drop_table :favorites
  end
end
