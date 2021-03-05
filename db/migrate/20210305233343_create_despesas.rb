class CreateDespesas < ActiveRecord::Migration[6.1]
  def change
    create_table :despesas do |t|
      t.datetime :datEmissao
      t.text :txtFornecedor
      t.decimal :vlrLiquido, precision: 5, scale: 2
      t.text :urlDocumento
      t.references :candidato, null: false, foreign_key: true

      t.timestamps
    end
  end
end
