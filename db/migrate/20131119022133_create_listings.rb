class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :address
      t.decimal :price
      t.integer :number_of_roomates
      t.text :notes

      t.timestamps
    end
  end
end
