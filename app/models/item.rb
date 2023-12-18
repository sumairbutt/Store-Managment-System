class Item < ApplicationRecord
    # belongs_to :menu, optional: false
    # belongs_to :order, optional: true
    has_many :item_orders
    has_many :orders, through: :order_items
end
