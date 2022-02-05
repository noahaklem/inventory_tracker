class ProductsController < ApplicationController

  def index
    @warehouses = current_user.warehouses

    if !params[:warehouse].blank?
      @products = Product.by_warehouse(params[:warehouse]).alpha
    elsif !params[:warehouse_id].blank?
      @products = current_warehouse.products
    else
      @products = current_user.products.uniq
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      flash[:notice] = "Product created successfully!"
      if params[:warehouse_id]
        redirect_to warehouse_products_path(params[:warehouse_id])
      else
        redirect_to products_path
      end
    else
      flash[:notice] = "Product not saved."
      render "products/new"
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
        redirect_to warehouses_path, flash[:notice] = "Warehouse not found."
      else
        @product = @warehouse.products.find_by(id: params[:id])
        redirect_to warehouse_products_path(@warehouse), flash[:notice] = "Product not found" if @product.nil?
      end
    else
      @product = Product.find(params[:id])
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to products_path
  end

  def destroy
    if params[:warehouse_id]
      warehouse = Warehouse.find(params[:warehouse_id])
      product = Product.find(params[:id])
      warehouse.products.delete(product)
      redirect_to warehouse_products_path(params[:warehouse_id])
    else
      Product.find(params[:id]).delete
      redirect_to products_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :quantity, :user_id, warehouse_ids: [])
  end
end
