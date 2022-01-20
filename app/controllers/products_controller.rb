class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to product_path(@post)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to product_url
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description)
  end
end
