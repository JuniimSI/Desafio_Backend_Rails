FactoryBot.define do
    factory :candidato do
      txNomeParlamentar {FFaker::Lorem.word}
      cpf {FFaker::Lorem.word}
      ideCadastro {FFaker::Lorem.word}
    end
end