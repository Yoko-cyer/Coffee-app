require 'rails_helper'

RSpec.describe "Pages", type: :request do

  describe "GET /" do
    before(:each) do
      get "/"
    end

    it "should render the pages/index page" do
      expect(response).to render_template(:index)
    end

    it "should respond with a status of 200" do
      # expect(response).to have_http_status(200)
      expect(response).to have_http_status(:success)
    end

  end
end
