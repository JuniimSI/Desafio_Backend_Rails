require 'rails_helper'

RSpec.describe "Candidato", type: :request do
    it "has the mensagem" do
        get candidato_path
        expect(response.body).to include('Upload')
    end
end
