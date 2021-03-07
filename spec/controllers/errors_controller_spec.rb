require 'rails_helper'

RSpec.describe ErrorsController do
    context "Get #not_found" do
        it "should success and render to 404 page" do
            get :not_found
            expect(response).to have_http_status(404)  
            expect(response).to render_template(:not_found)  
        end       
    end

    context "Get #bad_request" do
        it "should success and render to 400 page" do
            get :bad_request
            expect(response).to have_http_status(400)  
            expect(response).to render_template(:bad_request)  
        end       
    end

    context "Get #internal_server_error" do
        it "should success and render to 500 page" do
            get :internal_server_error
            expect(response).to have_http_status(500)  
            expect(response).to render_template(:internal_server_error)  
        end       
    end
end