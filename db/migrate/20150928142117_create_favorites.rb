class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :favoriter, index: true
      t.references :favorited, index: true

      t.timestamps null: false
      
      t.index [:favoriter_id, :favorited_id], unique: true
    end
  end
end
