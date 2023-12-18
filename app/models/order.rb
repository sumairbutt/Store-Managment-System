class Order < ApplicationRecord
    has_many :order_items
    has_many :items, through: :order_items

    has_one :order_history
    belongs_to :user

    enum status: {
        in_progress: 0,
        completed: 1 
    }

end
