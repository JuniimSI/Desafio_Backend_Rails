require 'rails_helper' 

describe Candidato do 
    describe "ideCadastro must be valid" do
        it "is valid candidato" do           
            candidato = build(:candidato, ideCadastro: nil)
            expect(candidato).to_not be_valid 
        end       
    end

end