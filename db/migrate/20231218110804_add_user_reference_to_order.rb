class AddUserReferenceToOrder < ActiveRecord::Migration[7.1]
  def change
    add_reference :orders, :user
  end
end
