class ProductsController < ApplicationController
  def index
    @products = Product.joins(:brand)
  end

  def show
    @product = Product.find(params[:id])
    @brand = @product.brand_id ? Brand.find(@product.brand_id): false
    @type = @product.type_id ? Type.find(@product.type_id): false
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to root_path
  end

  private
  def product_params
    params.require(:product).permit(:title, :type_id, :brand_id)
  end
end