class CreateCandidatos < ActiveRecord::Migration[6.1]
  def change
    create_table :candidatos do |t|
      t.string :txNomeParlamentar
      t.string :cpf
      t.string :ideCadastro
      t.integer :nuCarteiraParlamentar
      t.integer :nuLegislatura
      t.string :sgUF
      t.string :sgPartido
      t.integer :codLegislatura
      t.integer :numSubCota
      t.text :txtDescricao
      t.integer :numEspecificacaoSubCota
      t.text :txtDescricaoEspecificacao
      t.text :txtFornecedor
      t.string :txtCNPJCPF
      t.integer :txtNumero
      t.integer :indTipoDocumento
      t.datetime :datEmissao
      t.decimal :vlrDocumento, precision: 5, scale: 2
      t.decimal :vlrGlosa, precision: 5, scale: 2
      t.decimal :vlrLiquido, precision: 5, scale: 2
      t.integer :numMes
      t.integer :numAno
      t.integer :numParcela
      t.text :txtPassageiro
      t.text :txtTrecho
      t.integer :numLote
      t.integer :numRessarcimento
      t.decimal :vlrRestituicao, precision: 5, scale: 2
      t.integer :nuDeputadoId
      t.integer :ideDocumento
      t.text :urlDocumento

      t.timestamps
    end
  end
end
