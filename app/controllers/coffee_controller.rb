class CoffeeController < ApplicationController

    before_action :coffee_params, only: [:create, :update]
    before_action :set_coffee, only: [:edit, :show, :destroy]

    def index
        @coffees = Coffee.all
    end

    def show
        
    end

    def new
    end

    def create
        @coffee = Coffee.create(coffee_params)
        redirect_to coffee_path
    end

    def edit
        
    end

    def update
        @coffee.update(coffee_params)
        redirect_to show_coffee_path
    end

    def destroy

        # if @index
        #     @deleted_coffee = @@coffees.delete_at(@index)
        #     render json: @@coffees, status: 200
        # else
        #     render json: { error: "Could not find coffee"}, status: 404
        # end

        @coffee.destroy
        redirect_to coffee_path
    end

    private 

    def coffee_params
        params.require(:coffee).permit(:name, :description, :price)
    end

    def set_coffee
        @coffee = Coffee.find(params[:id])
    end

end
