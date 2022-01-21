class WarehousesController < ApplicationController

  def index
    @warehouses = Warehouse.all
  end

  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def edit
  end

  def new
  end

  def update
  
  end

  def create
  end

  def destroy
  end

  private

  def warehouse_params
    params.require(:warehouse).permit(:location)
  end
end
