class Politician < ApplicationRecord
    has_many :bills
    has_many :votes
    has_many :user_politicians
    has_many :users, through: :user_politicians
    
    def years_in_office
        start = self.start_date.split('-')
        start_datetime = DateTime.new(start[0].to_i, start[1].to_i, start[2].to_i)
        now = Date.today
        
        days = (now - start_datetime).to_i
        years = (days/365.25).round.to_s
    end 
    
    def full_name 
        "#{self.first_name} #{self.last_name}"
    end 
end
