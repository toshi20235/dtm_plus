class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.integer :music_id, null: false
      t.timestamps
    end
  end
end
