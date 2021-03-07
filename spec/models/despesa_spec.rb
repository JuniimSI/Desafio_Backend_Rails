require 'rails_helper' 

describe Despesa do 
    describe "vlrLiquido must be valid" do
        it "is valid despesa" do           
            despesa = build(:despesa, vlrLiquido: -1.20)
            expect(despesa).to_not be_valid 
        end       
    end

end