class CoffeeController < ApplicationController

    skip_before_action :verify_authenticity_token

    before_action :set_coffee, only: [:show, :update, :destroy]

    # pretend model
    @@coffees = [
        {id: 1, name: "Latte", description: "Milk iin coffee with foam on top", price: 4},
        {id: 2, name: "Affogato", description: "Coffee with ice cream", price: 15},
        {id: 3, name: "Americano", description: "Black coffee", price: 1}
    ]

    def index
        render :index, locals: {coffees: @@coffees}
    end

    def show
        
    end

    def create

        created_coffee = {
            id: @@coffees.last[:id] + 1,
            name: params[:name],
            description: params[:description],
            price: params[:price]
        }
        
        @@coffees << created_coffee

        render json: created_coffee, status: 200

    end

    def update

        if @index 
            ## Pull existing coffee
            @coffee = @@coffees[@index]

            ## update coffee
            updated_coffee = {
                id: @coffee[:id],
                name: params[:name],
                description: params[:description],
                price: params[:price]
            }
    
            @@coffees[@index] = updated_coffee
            render json: updated_coffee, status: 200
        else
            ## 404
            render json: { error: "Could not find coffee"}, status: 404
        end

    end

    def destroy

        if @index
            @deleted_coffee = @@coffees.delete_at(@index)
            render json: @@coffees, status: 200
        else
            render json: { error: "Could not find coffee"}, status: 404
        end
    end

    private 

    def set_coffee
        # Get id from parameters that are passed in
        @id = params[:id].to_i

        # Find the position of the coffee in the array 
        @index = @@coffees.index{ |coffee| coffee[:id] == @id }

        # if index exists
        if @index
            # assign coffee
            @coffee = @@coffees[@index]
        else
            # else print error to screen
            render json: { error: "Could not find coffee" }, status: 404
        end
    end

end
