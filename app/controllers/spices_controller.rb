class SpicesController < ApplicationController

    def index 
        render json: Spice.all 
    end

    def show
        spice = find_spice
        render json: spice 
    end

    def create 
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end 

    def update
        spice = find_spice
        if spice 
            spice.update(spice_params)
            render json: spice
        else 
            render json: {error: "spice not found"}, status: :not_found
        end
    end 

    def destroy
        spice = find_spice
        if spice 
            spice.destroy
        else 
            render json: {error: "spice not found"}, status: not_found
        end 
    end 


    private 
    def spice_params
        params.permit(:title, :image, :description,:notes, :rating)
    end

    def find_spice 
        Spice.find_by(id: params[:id])
    end
end
