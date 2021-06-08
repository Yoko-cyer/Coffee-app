class CoffeeController < ApplicationController

    @@coffees = [
        {id: 1, name: "Latte", description: "Milk iin coffee with foam on top", price: 4},
        {id: 2, name: "Affogato", description: "Coffee with ice cream", price: 15},
        {id: 3, name: "Americano", description: "Black coffee", price: 1}
    ]

    def index
        render json: @@coffees
    end

    def show
        id = params[:id].to_i
        @coffee = @@coffees.find{|coffee| coffee[:id] == id}
        
        if @coffee
            render json: @coffee, status: 200
        else
            render json: "Coffee not found", status: 404
        end
    end
end
