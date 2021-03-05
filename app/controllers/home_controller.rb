class HomeController < ApplicationController
    def index
        @deputados = Candidato.all
    end

    def importar
        # erros = []
        # file = params["csv"].tempfile.path
        # File.open(file).each do |row|
        #     begin
        #         row = row.split(";")
        #         next if row[0] == "txNomeParlamentar"

        #         nome = row[0].strip rescue row[0]
        #         cpf = row[1].strip rescue row[1]

        #         Candidato.create(txNomeParlamentar: nome, cpf: cpf)

        #     rescue Exception => err
        #         erros << err.message
        #     end
        # end
        # if erros.blank?
        #     flash[:success] = "importado com sucesso"
        # else
        #     flash[:error] = erros.join(",")
        # end

        # redirect_to "/"
    end
end
