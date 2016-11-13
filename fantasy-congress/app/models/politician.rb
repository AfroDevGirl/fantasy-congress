class Politician < ApplicationRecord
    has_many :bills
    has_many :votes
end
