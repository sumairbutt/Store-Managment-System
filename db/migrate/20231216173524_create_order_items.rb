class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      t.references :item
      t.references :order
      t.timestamps
    end
  end
end
