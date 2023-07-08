class CreateMusics < ActiveRecord::Migration[6.1]
  def change
    create_table :musics do |t|
       t.integer :user_id, null: false
       t.string :name, null: false
       t.string :explanation, null: false
       t.string :audio, null: false
        t.text :post_content, null: false
      t.timestamps
    end
  end
end
