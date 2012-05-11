class CreateMusics < ActiveRecord::Migration
  def self.up
    create_table :musics do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :musics
  end
end
