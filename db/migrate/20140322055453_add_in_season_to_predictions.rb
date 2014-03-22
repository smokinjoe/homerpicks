class AddInSeasonToPredictions < ActiveRecord::Migration
  def self.up
    add_column :predictions, :in_season, :integer, { :null => false, :default => 1 }
    execute("UPDATE predictions SET in_season = 0")
  end
  
  def self.down
    remove_column :predictions, :in_season
  end  
end
