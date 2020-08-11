require 'rails_helper'

RSpec.describe FavsController, type: :controller do

  describe "POST #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  # describe "DELETE #destroy" do
  #   it "returns http success" do
  #     get :destroy
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
