class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, { :null => false, :limit=> 255 }

      t.timestamps
    end
    add_index :groups, :name
  end
end
