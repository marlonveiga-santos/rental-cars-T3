class ManufacturersController < ApplicationController
    
    def index
            @manufacturers = Manufacturer.all
    end

    def show
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
        @manufacturer = Manufacturer.find(id)
    end

    def update
        @manufacturer = Manufacturer.find(id)
        @manufacturer.update(manufacturer_params)
        if @manufacturer.save
        redirect_to @manufacturer
    else
        render :edit
    end
    end

    def destroy
        @manufacturer = Manufacturer.find(id)
        @manufacturer.destroy
        redirect_to @manufacturer
    end

    private

    def manufacturer_params
        params.require(:manufacturer).permit(:name)
    end

    def id
        id = params[:id]
    end
    

end