class OrderHistory < ApplicationRecord
    belongs_to :order, optional: true
end
