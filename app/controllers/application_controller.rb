class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    def initiate_order
        @current_order ||= current_order || create_current_order
    end
    
    def create_current_order
        order = current_user.orders.create(status: "in_progress", order_number: generate_order_number)
        session[:current_order_id] = order.id
        order
    end
    
    private
    
    def current_order
        Order.find_by(id: session[:current_order_id], status: "in_progress")
    end

    def generate_order_number
        order_number = rand(999999)
        # Check if the order number is already in use
        while Order.exists?(order_number: order_number)
          order_number = rand(999999)
        end
        return order_number
    end

end
