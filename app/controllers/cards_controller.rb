class CardsController < ApplicationController


  def update
  end

  def new
  end

  def create
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    customer = Payjp::Customer.create(
      card: params[:card_token],
      metadata: {user_id: current_user.id}
    )
    @card = Card.new(
      card_token: customer.default_card,
      client_token: customer.id,
      user_id: current_user.id
      
    )
    @card.save
    redirect_to root_path
  end

  def destroy #PayjpとCardデータベースを削除します
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
      customer = Payjp::Customer.retrieve(card.client_token)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    @card = Card.find_by(id: params[:id])
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
      customer = Payjp::Customer.retrieve(card.client_token)
      @default_card_information = customer
    end
  end
end
