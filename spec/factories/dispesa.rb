FactoryBot.define do
    factory :despesa do
        datEmissao {FFaker::Time.datetime}
        txtFornecedor {FFaker::Name.first_name}
        vlrLiquido {FFaker::Commerce.price}
        urlDocumento {FFaker::Lorem.words}
    end
end