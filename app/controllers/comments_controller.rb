class CommentsController < ApplicationController
  def create
    product = Product.find(params[:id])
    if Comment.create(comment: params[:comment],user_id: current_user.id,product_id: product.id)
      redirect_to product_path(product.id)
    else
      render product_path(product.id)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update(comment_params)
      redirect_to product_path(comment.product.id)
    else
      render :show
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
      redirect_to product_path(@comment.product.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end