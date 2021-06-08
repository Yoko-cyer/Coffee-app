require 'rails_helper'

RSpec.describe "Pages", type: :request do
  
  describe "GET /" do
    it "should render the pages/index page" do
      get "/"
      expect(response).to render_template(:index)
    end
  end
end
