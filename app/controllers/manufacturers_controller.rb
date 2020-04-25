class ManufacturersController < ApplicationController
    
    def index
            @manufacturers = Manufacturer.all
    end

    def show
        id = params[:id]
        @manufacturer = Manufacturer.find(id)
    end

    def new
        @manufacturer = Manufacturer.new
    end

    def create
        @manufacturer = Manufacturer.new(manufacturer_params) 
        if @manufacturer.save
        redirect_to manufacturer_path(id: @manufacturer.id)
        else
            render :new
        end
    end

    def edit
        id = params[:id]
        @manufacturer = Manufacturer.find(id)
    end

    def update
        id = params[:id]
        @manufacturer = Manufacturer.find(id)
        @manufacturer.update(manufacturer_params)
        if @manufacturer.save
        redirect_to @manufacturer
    else
        render :edit
    end
    end

    private

    def manufacturer_params
        params.require(:manufacturer).permit(:name)
    end

end