class FavsController < ApplicationController
  
  def index
      @user = current_user
      favs = Fav.where(user_id: @user.id).all
      @favs = []
      favs.each do |fav|
        @favs << Product.find(fav.product_id)
      end
  end

  def create
    product_id = Product.find(params[:id])
    Fav.create(user_id:current_user.id, product_id:product_id.id)
  end

  def destroy
    product = Product.find(params[:id])
    @fav = Fav.find_by(product:product.id, user_id: current_user.id)
    @fav.destroy
  end
end