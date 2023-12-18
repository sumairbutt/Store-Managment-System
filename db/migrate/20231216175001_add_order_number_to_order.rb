class AddOrderNumberToOrder < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :order_number, :integer
  end
end
