require 'rails_helper' 

describe Candidato do 
    describe "ideCadastro must be valid" do
        it "is valid candidato" do           
            candidato = build(:candidato, ideCadastro: nil)
            expect(candidato).to_not be_valid 
        end       
    end

    describe "despesa_maior must be valid" do
        it "is not nil" do           
            candidato = build(:candidato)
            despesa = create(:despesa, candidato: candidato)
            expect(candidato.despesas_maiores).to_not be_nil
        end       
    end

    describe "despesa_max must be valid" do
        it "is max of the all" do           
            candidato = build(:candidato)
            despesa = create(:despesa, candidato: candidato)
            despesa2 = create(:despesa, candidato: candidato)
            expect(candidato.despesa_max).to eq(123.00)
        end       
    end

    describe "despesa_somatorio must be valid" do
        it "is sum all" do           
            candidato = build(:candidato)
            despesa = create(:despesa, candidato: candidato)
            despesa2 = create(:despesa, candidato: candidato)
            expect(candidato.despesa_somatorio).to eq(246.00)
        end       
    end

    describe "despesas must be valid" do
        it "all candidato have despesa" do           
            candidato = build(:candidato)
            despesa = create(:despesa, candidato: candidato)
            expect(candidato.get_despesas).to_not be_nil
        end       
    end

    

end