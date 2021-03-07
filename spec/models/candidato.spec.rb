require 'rails_helper'

RSpec.describe Candidato, type: :model do
   it "expect valid candidato" do
       candidato = build(:candidato, ideCadastro: nil)
       expect(candidato).to_not be_valid
   end
end