class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :title
      t.boolean :display, :default=>'true'
      t.integer :sort_id, :default=>0

      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
