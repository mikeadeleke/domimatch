class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :price_range
      t.string :type_of_house
      t.string :term

      t.timestamps
    end
  end
end
