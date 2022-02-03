class WarehousesController < ApplicationController

  def index
    @warehouses = current_user.warehouses
  end

  def show 
    redirect_to warehouse_products_path(params[:warehouse_id])
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = current_user.warehouses.build(warehouse_params)
    if @warehouse.valid?
      @warehouse.save
      flash[:notice] = "Warehouse created!"
      redirect_to warehouses_path
    else
      flash[:notice] = "Opps something went wrong."
      redirect_to new_warehouse_path
    end
  end

  def edit 
    @warehouse = Warehouse.find(params[:id])
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
    params.require(:warehouse).permit(:name,:user_id, product_ids: [], product_attributes: [:name, :price, :description, :quantity])
  end

end
