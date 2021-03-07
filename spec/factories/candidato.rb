FactoryBot.define do
    factory :candidato do
      txNomeParlamentar {FFaker::Name.first_name}
      cpf {FFaker::Lorem.word}
      ideCadastro {FFaker::Lorem.word}
    end

end