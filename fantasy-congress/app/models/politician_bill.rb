class PoliticianBill < ApplicationRecord
    belongs_to :politician
    belongs_to :bill
end
