class Despesa < ApplicationRecord
  belongs_to :candidato
  validates :vlrLiquido, numericality: { greater_than: 0 }
end
