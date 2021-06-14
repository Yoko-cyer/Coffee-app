class CoffeeController < ApplicationController

    skip_before_action :verify_authenticity_token

    before_action :get_id, only: [:show, :update]

    # pretend model
    @@coffees = [
        {id: 1, name: "Latte", description: "Milk iin coffee with foam on top", price: 4},
        {id: 2, name: "Affogato", description: "Coffee with ice cream", price: 15},
        {id: 3, name: "Americano", description: "Black coffee", price: 1}
    ]

    def index
        render json: @@coffees
        # json = JavaScript Obect Notation
    end

    def show
        
        @coffee = @@coffees.find{|coffee| coffee[:id] == @id}
        
        if @coffee
            render json: @coffee, status: 200
        else
            render json: "Coffee not found", status: 404
        end
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

        index = @@coffees.index{ |coffee| coffee[:id] == @id }
        

        if index 
            ## Pull existing coffee
            @coffee = @@coffees[index]

            ## update coffee
            updated_coffee = {
                id: @coffee[:id],
                name: params[:name],
                description: params[:description],
                price: params[:price]
            }
    
            @@coffees[index] = updated_coffee
            render json: updated_coffee, status: 200
        else
            ## 404
            render json: { error: "Could not find coffee"}, status: 404
        end

    end


    private 

    def get_id
        @id = params[:id].to_i
    end

end
