class RealEstatesController < ApplicationController
  def index
    @real_estates = RealEstate.all
  end

  def show
    @real_estate = RealEstate.find(params[:id])
  end

  def new
    @real_estate = RealEstate.new
  end

  def create
    @real_estate = RealEstate.new(real_estate_params)
    if @real_estate.save
      flash[:success] = "Created"
      redirect_to @real_estate
    else
      render 'new'
    end
  end

  def edit
    @real_estate = RealEstate.find(params[:id])
  end

  def update
    @real_estate = RealEstate.find(params[:id])
    if @real_estate.update_attributes(real_estate_params)
      flash[:success] = 'Data Updated'
      redirect_to @real_estate
    else
      render 'edit'
    end
  end

  def destroy
    RealEstate.find(params[:id]).destroy
    flash[:success] = 'Data Deleted'
    redirect_to real_estate_index_path
  end

  private

    def real_estate_params
      params.require(:real_estate).permit(:street, :city, :zip,
                                           :state, :beds, :baths,
                                           :sq_ft, :type_of_estate,
                                           :sale_date, :price, :latitude,
                                           :longitude)
    end
end
