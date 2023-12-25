class Item < ApplicationRecord
    # belongs_to :menu, optional: false
    # belongs_to :order, optional: true
    has_one_attached :image
    has_many :item_orders
    has_many :orders, through: :order_items
    belongs_to :menu
end
