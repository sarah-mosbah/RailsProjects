class CatRentalsController < ApplicationController
    def new
        @cats= Cat.all
        @cat_rental=CatRentalRequest.new

        render :new
    end


    def create
        rent=CatRentalRequest.new(cat_rental_params)
        if rent.save
            render plain: "Saved Successfully"
        else
           redirect_to new_cat_rental_path
        end
    end


    def cat_rental_params
        params.require(:cat_rental).permit(:start_date,:end_date,:cat_id)     
    end
end