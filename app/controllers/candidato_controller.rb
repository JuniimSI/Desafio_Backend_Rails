class CandidatoController < ApplicationController
    before_action :set_candidato, only: [:show]

    def index
        @candidatos = Candidato.all
    end

    def show
        @despesas = @candidato.despesas.where.not(datEmissao: nil).order(vlrLiquido: :desc)
    end

    def importar
        erros = []
        if params['csv'] != nil
            file = params['csv'].path
            File.open(file).each do |row|
                begin
                row = row.gsub(/"/, "")
                row = row.split(";")

                next if row[0] == "txNomeParlamentar"
                next if row[5] != "CE"

                candidato = Candidato.find_by_cpf(row[1])
                if candidato != nil
                    datEmissao = row[16].strip rescue row[16]
                    txtFornecedor = row[12].strip rescue row[12]
                    vlrLiquido = row[19].strip rescue row[19]
                    urlDocumento = row[30].strip rescue row[30]
                    candidato.despesas.create(datEmissao: datEmissao, txtFornecedor: txtFornecedor, vlrLiquido: vlrLiquido, urlDocumento: urlDocumento)

                    next
                end

                txNomeParlamentar = row[0].strip rescue row[0]
                cpf = row[1].strip rescue row[1]
                ideCadastro = row[2].strip rescue row[2]
                nuCarteiraParlamentar = row[3].strip rescue row[3]
                nuLegislatura = row[4].strip rescue row[4]
                sgUF = row[5].strip rescue row[5]
                sgPartido = row[6].strip rescue row[6]
                codLegislatura = row[7].strip rescue row[7]
                numSubCota = row[8].strip rescue row[8]
                txtDescricao = row[9].strip rescue row[9]
                numEspecificacaoSubCota = row[10].strip rescue row[10]
                txtDescricaoEspecificacao = row[11].strip rescue row[11]
                txtFornecedor = row[12].strip rescue row[12]
                txtCNPJCPF = row[13].strip rescue row[13]
                txtNumero = row[14].strip rescue row[14]
                indTipoDocumento = row[15].strip rescue row[15]
                datEmissao = row[16].strip rescue row[16]
                vlrDocumento = row[17].strip rescue row[17]
                vlrGlosa = row[18].strip rescue row[18]
                vlrLiquido = row[19].strip rescue row[19]
                numMes = row[20].strip rescue row[20]
                numAno = row[21].strip rescue row[21]
                numParcela = row[22].strip rescue row[22]
                txtPassageiro = row[23].strip rescue row[23]
                txtTrecho = row[24].strip rescue row[24]
                numLote = row[25].strip rescue row[25]
                numRessarcimento = row[26].strip rescue row[26]
                vlrRestituicao = row[27].strip rescue row[27]
                nuDeputadoId = row[28].strip rescue row[28]
                ideDocumento = row[29].strip rescue row[29]
                urlDocumento = row[30].strip rescue row[30]

                Candidato.create(
                    txNomeParlamentar: txNomeParlamentar, cpf: cpf, ideCadastro: ideCadastro, nuCarteiraParlamentar: nuCarteiraParlamentar, nuLegislatura: nuLegislatura,
                    sgUF: sgUF, sgPartido: sgPartido, codLegislatura: codLegislatura, numSubCota: numSubCota, txtDescricao: txtDescricao, numEspecificacaoSubCota: numEspecificacaoSubCota,
                    txtDescricaoEspecificacao: txtDescricaoEspecificacao, txtFornecedor: txtFornecedor, txtCNPJCPF: txtCNPJCPF, txtNumero: txtNumero, indTipoDocumento: indTipoDocumento, datEmissao: datEmissao,
                    vlrDocumento: vlrDocumento, vlrGlosa: vlrGlosa, vlrLiquido: vlrLiquido, numMes: numMes, numAno: numAno, numParcela: numParcela, txtPassageiro: txtPassageiro,
                    txtTrecho: txtTrecho, numLote: numLote, numRessarcimento: numRessarcimento, vlrRestituicao: vlrRestituicao, nuDeputadoId: nuDeputadoId, ideDocumento: ideDocumento,
                    urlDocumento: urlDocumento
                )

                next if Candidato.find_by_cpf(row[1]) == nil

                candidato = Candidato.find_by_cpf(row[1])
                candidato.despesas.create(datEmissao: datEmissao, txtFornecedor: txtFornecedor, vlrLiquido: vlrLiquido, urlDocumento: urlDocumento)
                

                rescue Exception => err
                    erros << err.message
                end
            end

            if erros.blank?
                flash[:notice] = "Importado com sucesso"
            else
                flash[:alert] = erros.join(", ")
            end

            redirect_to candidato_index_path
        else
            redirect_to candidato_index_path
            flash[:alert] = "Arquivo vazio, selecione para enviar."
        end
    end

    private

    def set_candidato
        @candidato = Candidato.find(params[:id])
    end
    

end
