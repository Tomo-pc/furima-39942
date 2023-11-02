class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :order, null: false, foreign_key: true
      t.string :post_code, null: false
      t.integer :prefectures_id, null: false
      t.string :city, null: false
      t.string :city_address, null: false
      t.string :building_name
      t.string :telephone, null: false
      t.timestamps
    end
  end
end