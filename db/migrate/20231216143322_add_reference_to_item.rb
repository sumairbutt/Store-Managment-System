class AddReferenceToItem < ActiveRecord::Migration[7.1]
  def change
    add_reference :items, :menu
    add_reference :items, :order
  end
end
