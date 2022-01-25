class ProductsController < ApplicationController

  def index
    if params[:warehouse_id]
      @products = Warehouse.find(params[:warehouse_id])
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    byebug
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      redirect_to warehouse_product_path(@product)
    else
      redirect_to new_warehouse_product_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :quantity, :warehouse_id)
  end
end
