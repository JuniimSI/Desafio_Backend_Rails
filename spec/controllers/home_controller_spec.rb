require 'rails_helper'

RSpec.describe HomeController do
    context "Get #index" do
        it "should success and render to index page" do
            get :index
            expect(response).to have_http_status(200)  
            expect(response).to render_template(:index)  
        end      
    end
end