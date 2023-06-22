class ProductCategoriesController < ApplicationController
    def create
        @product_category = ProductCategory.create(product_category_params)
        if @product_category.valid?
            render json: @product_category
        else
            render json: { errors: @product_category.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def product_category_params
        params.permit(:product_id, :category_id)
    end
end