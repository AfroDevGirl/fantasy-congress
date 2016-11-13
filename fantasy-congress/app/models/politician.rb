class Politician < ApplicationRecord
    has_many :bills
    has_many :votes
    
    def years_in_office
        start = self.start_date.split('-')
        start_datetime = DateTime.new(start[0].to_i, start[1].to_i, start[2].to_i)
        now = Date.today
        
        days = (now - start_datetime).to_i
        years = (days/365.25).round.to_s
    end 
end
