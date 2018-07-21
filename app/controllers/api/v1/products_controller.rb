class Api::V1::ProductsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @products = Product.all
    render json: @products
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
       if product.save
         render :nothing => true, :status => 201
       else
         render json: { errors: article.errors }, status: 422
       end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.update(params[:id], product_params)
  end

  private
    def product_params
      params.require(:product).permit(:name, :price)
    end
end
