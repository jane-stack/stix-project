class ProductsController < ApplicationController
    def index
        @product = Product.all
        render json: @product
    end

    def show
        @product = Product.find(params[:id])
        @categories = @product.categories
        render json: @categories
    end
end
