require 'rails_helper'

RSpec.describe "Coffees", type: :request do
  describe "GET /coffee" do

    before(:each) do
      get "/coffee"
    end

    it "should respond with a status code of 200 Success" do
      expect(response).to have_http_status(:success)
    end

    it "should render index template when calling index" do
      expect(response).to render_template("index")
    end
  end

  describe "GET /coffee/:id" do
    it "should return status code 200 when given correct id" do
      get "/coffee/1"
      expect(response).to have_http_status(:success)
      expect(response).to render_template("show")
    end

    it "should return 404 Not Found when given invalid id" do
      get "/coffee/99"
      expect(response).to have_http_status(404)
    end
  end

  describe "POST /coffee" do
    it "should return valid json and a status code of 200" do
      post "/coffee", :params => {name: "Mocha", description: "Hot Chocolate with a shot of coffee", price: 5.5}
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response.body).to include("Hot Chocolate")
    end
  end

  describe "PUT /coffee/:id" do
    it "should respond with json given a valid id" do
      put "/coffee/1", :params => {name: "Mocha", description: "Hot Chocolate with a shot of coffee", price: 5.5}
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response.body).to include("Hot Chocolate")
    end

    it "should respond with 404 given an invalid id" do
      put "/coffee/99", :params => {name: "Mocha", description: "Hot Chocolate with a shot of coffee", price: 5.5}
      expect(response).to have_http_status(404)
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

  describe "DELETE /coffee/:id" do
    it "should respond with json when given a valid id" do
      delete "/coffee/1"
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  
    it "should respond with 404 given an invalid id" do
      delete "/coffee/99"
      expect(response).to have_http_status(404)
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

end
