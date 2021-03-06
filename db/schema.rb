# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_05_233343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidatos", force: :cascade do |t|
    t.string "txNomeParlamentar"
    t.string "cpf"
    t.string "ideCadastro"
    t.integer "nuCarteiraParlamentar"
    t.integer "nuLegislatura"
    t.string "sgUF"
    t.string "sgPartido"
    t.integer "codLegislatura"
    t.integer "numSubCota"
    t.text "txtDescricao"
    t.integer "numEspecificacaoSubCota"
    t.text "txtDescricaoEspecificacao"
    t.text "txtFornecedor"
    t.string "txtCNPJCPF"
    t.integer "txtNumero"
    t.integer "indTipoDocumento"
    t.datetime "datEmissao"
    t.decimal "vlrDocumento", precision: 10, scale: 2
    t.decimal "vlrGlosa", precision: 10, scale: 2
    t.decimal "vlrLiquido", precision: 10, scale: 2
    t.integer "numMes"
    t.integer "numAno"
    t.integer "numParcela"
    t.text "txtPassageiro"
    t.text "txtTrecho"
    t.integer "numLote"
    t.integer "numRessarcimento"
    t.decimal "vlrRestituicao", precision: 10, scale: 2
    t.integer "nuDeputadoId"
    t.integer "ideDocumento"
    t.text "urlDocumento"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "despesas", force: :cascade do |t|
    t.datetime "datEmissao"
    t.text "txtFornecedor"
    t.decimal "vlrLiquido", precision: 10, scale: 2
    t.text "urlDocumento"
    t.bigint "candidato_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidato_id"], name: "index_despesas_on_candidato_id"
  end

  add_foreign_key "despesas", "candidatos"
end
