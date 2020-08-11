class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy, :edit, :update]
  before_action :set_category, only: [:new, :edit, :show, :create]
  before_action :correct_user, only: [:edit, :update]
  

  def index
    @products = Product.includes(:images).order('created_at DESC')
    # @products = Product.all.includes(:user).recent
    @images = Image.all.order("created_at DESC").limit(8) 
  end

  def new
    @product = Product.new
    @product.images.build
  end

  def create
    @product = Product.new(product_params)
    @product[:seller_id] = current_user.id
    if @product.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @product.update_attributes(product_params)
      redirect_to root_path
    else
      render :new
    end 
  end

  def show
    @grandchild = Category.find(@product.category_id)
    @child = @grandchild.parent
    @parent = @child.parent
    @fav = Fav.new
    @favs = @product.favs.includes(:user)
    @comments = Comment.where(product_id: params[:id])
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    redirect_to search_products_path if params[:keyword] == ""
    @products = Product.where('brand LIKE(?) OR name LIKE(?)', "%#{params[:keyword]}%", "%#{params[:keyword]}%").order("created_at DESC").limit(132)
  end
  
  def buy
    @product = Product.find_by(id: params[:format])
  end

  def purchase
    product = Product.find_by(id: params[:format])    
    if current_user.card == nil
      redirect_to users_path
    else  
      Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
      Payjp::Charge.create(
        amount: product.price, # 決済する値段
        customer: current_user.card.client_token, # 登録カード情報
        currency: 'jpy'
      )
      product.buyer_id = current_user.id
      product.save
      redirect_to root_path
    end
  end

  def get_category_children
   @category_children = Category.find_by(category: "#{params[:product_category]}", ancestry: nil).children
  end

  def get_category_grandchildren
   @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, 
                                    :description, 
                                    :category_id,
                                    :brand,
                                    :price,
                                    :condition, 
                                    :shipping_charge,
                                    :shipping_area,
                                    :shipping_day,
                                    images_attributes: [:image, :_destroy, :id])
  end

  def set_category
    @category_parent_array = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.category
    end
  end

  def correct_user
    product = Product.find_by(id: params[:id])
    unless current_user.id == product.seller_id
      redirect_to root_path
    end
  end
end