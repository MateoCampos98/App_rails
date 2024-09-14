class ProductsController < ApplicationController
  #include Pagy::Backend
  skip_before_action :protect_pages, only: [:index, :show]
  def index
    @categories = Category.all.order(name: :asc).load_async
    @pagy, @products = pagy_countless(FindProducts.new.call(product_params_index).load_async, items: 20)
  end

  def show
    product
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save 
      redirect_to products_path, notice: t('.created')
    else
      render :new, status: :unprocessable_entity  
    end
  end

  def edit
    product
  end

  def update
    if product.update(product_params)
      redirect_to products_path, notice: t('.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    product.destroy
    redirect_to products_path, notice: t('.destroyed')
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :photo, :category_id)
  end

  def product_params_index
    params.permit(:category_id, :min_price, :max_price, :query_text, :order_by)
  end

  def product
    @product = Product.find(params[:id])
  end

end