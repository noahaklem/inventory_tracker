class ProductsController < ApplicationController

  def index
    if params[:warehouse_id]
      @warehouse = Warehouse.find(params[:warehouse_id])
      @products = Warehouse.find(params[:warehouse_id]).products.uniq
    else
      @products = Product.all
    end
  end

  def new
    @warehouse = Warehouse.find(params[:warehouse_id])
    @product = Product.new
  end

  def create
    byebug
    @product = current_user.products.build(product_params)
    if @product.valid?
      @product.save
      redirect_to warehouse_products_path
    else
      redirect_to new_warehouse_product_path
    end
  end

  def show
    @warehouse = Warehouse.find(params[:warehouse_id])
    @product = Product.find(params[:id])
  end

  def edit
    if params[:warehouse_id]
      @warehouse = Warehouse.find(params[:warehouse_id])
      if @warehouse.nil?
        redirect_to warehouses_path, alert: "Warehouse not found."
      else
        @product = @warehouse.products.find_by(id: params[:id])
        redirect_to warehouse_products_path(@warehouse), alert: "Product not found" if @product.nil?
      end
    else
      @product = Product.find(params[:id])
    end
  end

  def update
    warehouse = Warehouse.find(params[:warehouse_id])
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to warehouse_products_path(warehouse)
  end

  def destroy
    warehouse = Warehouse.find(params[:warehouse_id])
    product = Product.find(params[:id])
    warehouse.products.delete(product)
    redirect_to warehouse_products_path(params[:warehouse_id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :quantity, :user_id, :warehouse_id )
  end
end
