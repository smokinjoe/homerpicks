class CreatePredictions < ActiveRecord::Migration
  def change
    create_table :predictions do |t|
      t.references :user, index: true

      t.string :name, { :null => true }
      t.integer :wins
      t.integer :losses
      t.string :tiebreaker, { :null => true }
      t.boolean :confirmed, { :null => false, :default => false }
      
      t.timestamps
    end
  end
end
