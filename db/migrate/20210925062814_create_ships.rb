class CreateShips < ActiveRecord::Migration[6.0]
  def change
    create_table :ships do |t|
      t.string     :postalcode,      null: false
      t.integer    :prefecture_id,   null: false
      t.string     :city,            null: false
      t.string     :address,         null: false
      t.string     :building_name
      t.string     :phonenumber,     null: false
      t.references :order,           null: false
      t.timestamps
    end
  end
end
