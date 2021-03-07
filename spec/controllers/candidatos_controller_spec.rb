require 'rails_helper'

RSpec.describe CandidatoController do
    context "Get #index" do
        it "should success and render to index page" do
            get :index
            expect(response).to have_http_status(200)  
            expect(response).to render_template(:index)  
        end

        it "should array empty" do
            get :index 
            expect(assigns(:candidatos)).to be_empty
        end

        it "should have one candidato" do
            create(:candidato)
            get :index 
            expect(assigns(:candidatos)).to_not be_empty
        end
        
    end

    context "Get #show" do
        let(:candidato) {create(:candidato)}
        it "should success and render to show page" do
            get :show, params: {id: candidato.id}
            expect(response).to have_http_status(200)  
            expect(response).to render_template(:show)  
        end

        it "where have id" do
            get :show, params: {id: candidato.id}
            expect(assigns(:candidato)).to be_a(Candidato)
        end
        
    end

    context "Upload csv" do
        before(:each) do
            @file = fixture_file_upload('array_test.csv', 'text/csv')
        end
        
        it "should success insert csv on database" do
            expect do
                post :importar, params: {csv: @file }
            end.to change { Candidato.count }.by(3)
        end
    end



end