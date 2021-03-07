FactoryBot.define do
    factory :despesa do
        datEmissao {FFaker::Time.datetime}
        txtFornecedor {FFaker::Name.first_name}
        vlrLiquido {123.00}
        urlDocumento {FFaker::Lorem.words}
        candidato
    end
end