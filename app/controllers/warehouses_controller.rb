class WarehousesController < ApplicationController

  def index
   @warehouses = Warehouse.all
  end

  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def edit
    @warehouse = Warehouse.find(params[:id])
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.valid?
      @warehouse.save
      redirect_to warehouses_path
    else
      render 'new'
    end
  end

  def update
    @warehouse = Warehouse.find(params[:id])
    @warehouse.update(warehouse_params)
    redirect_to warehouses_path
  end

  def destroy
    Warehouse.find(params[:id]).destroy
    redirect_to warehouses_path
  end

  private

  def warehouse_params
    params.require(:warehouse).permit(:name)
  end
end
