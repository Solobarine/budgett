class Group < ApplicationRecord
    belongs_to :user
    has_many :deals
    
    validates :name, presence: true
    validates :icon, presence: true

    def total_deals
        total = 0
        deals.each do |deal|
          total += deal.amount
        end
        total
      end
end