class CreateSpreeOutOfStock < ActiveRecord::Migration[5.0]
  def change
    create_table :spree_out_of_stocks do |t|
      t.integer :stock_item_id, null: false
      t.timestamps
    end
  end
end
