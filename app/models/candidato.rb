class Candidato < ApplicationRecord
    has_many :despesas

    validates :ideCadastro, presence: { message: "Idecadastro must be valid" }

    def despesas_maiores
        self.despesas.where.not(datEmissao: nil).order(vlrLiquido: :desc).limit(7)
    end

    def despesa_max
        self.despesas.maximum(:vlrLiquido)
    end

    def despesa_somatorio
        self.despesas.sum(:vlrLiquido)
    end

    def get_despesas
        self.despesas.where.not(datEmissao: nil).order(vlrLiquido: :desc)
    end
    
    
end
