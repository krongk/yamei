class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :table_name
      t.integer :parent_id
      t.string :title
      t.string :image
      t.boolean :is_lock
      t.boolean :is_display

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
