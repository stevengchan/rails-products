class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    user_params = params.permit(:name, :description, :pricing)
    @product = Product.new(user_params)
    if @product.save
      redirect_to @product, notice: 'Product successfully created!'
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
    user_params = params.permit(:name, :description, :pricing)
    if @product.update(user_params)
      redirect_to @product, notice: 'User successfully updated!'
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url
  end
end


