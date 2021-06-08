require 'rails_helper'

RSpec.describe "Coffees", type: :request do
  describe "GET /coffee" do

    before(:each) do
      get "/coffee"
    end

    it "should respond with a status code of 200 Success" do
      expect(response).to have_http_status(:success)
    end

    it "should render json when calling index controller" do
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

  describe "GET /coffee/:id" do
    it "should return status code 200 when given correct id" do
      get "/coffee/1"
      expect(response).to have_http_status(:success)
    end

    it "should return 404 Not Found when given invalid id" do
      get "/coffee/99"
      expect(response).to have_http_status(404)
    end
  end

end
