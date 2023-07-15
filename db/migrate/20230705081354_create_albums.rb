class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.references :music, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      
      t.timestamps
    end
  end
end
