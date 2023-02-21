class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :logo_image
      t.string :address
      t.string :station
      t.string :genre
      t.string :access
      t.string :pc_s
      t.string :mobile_s
      t.string :open
      t.string :close
      t.string :url_pc
      t.timestamps
    end
  end
end
