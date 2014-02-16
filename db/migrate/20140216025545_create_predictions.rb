class CreatePredictions < ActiveRecord::Migration
  def change
    create_table :predictions do |t|
      t.references :user, index: true

      t.timestamps
    end
  end
end
