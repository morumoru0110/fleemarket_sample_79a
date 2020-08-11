class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(product_id: params[:product_id])
    @product = Product.find(params[:product_id])
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @like = current_user.likes.find_by(product_id: @product.id)
    @like.destroy
    # redirect_back(fallback_location: root_path)
  end

  def get_product
    @product = Product.find(params[:product_id])
  end
end