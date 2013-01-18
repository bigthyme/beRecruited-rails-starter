class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :api_team_id
      t.string	:name
      t.string  :nick
      t.timestamps
    end
  end

  # def self.down
  #   drop_table :teams
  # end
end
